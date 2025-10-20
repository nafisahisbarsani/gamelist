import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:game_list_cubit/ui/app_styles.dart';
import 'package:game_list_cubit/ui/custom_search_bar.dart';
import '../../ui/custom_card.dart';
import 'cubit/game_list_cubit.dart';
import 'cubit/game_list_state.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';

import 'game_detail_page.dart';

class GameListPage extends StatelessWidget {
  GameListPage({super.key});

  final TextEditingController _searchController = TextEditingController();
  final ValueNotifier<Timer?> _debounceTimer = ValueNotifier<Timer?>(null);
  final ScrollController _scrollController = ScrollController();

  void _onSearchChanged(BuildContext context, String query) {
    _debounceTimer.value?.cancel();

    _debounceTimer.value = Timer(const Duration(milliseconds: 500), () {
      if (query.isEmpty) {
        context.read<GameListCubit>().loadGames();
      } else {
        context.read<GameListCubit>().searchGames(query);
      }
    });
  }

  void _clearSearch(BuildContext context) {
    _searchController.clear();
    context.read<GameListCubit>().loadGames();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final cubit = context.read<GameListCubit>();

      if (_scrollController.hasListeners == false) {
        _scrollController.addListener(() {
          if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 300) {
            cubit.loadMoreGames();
          }
        });
      }

      cubit.loadGames();
    });

    return Scaffold(
      backgroundColor: AppStyles.black500,
      appBar: AppBar(
        title: Row(
          children: [
            SvgPicture.asset('assets/images/games.svg'),
            SizedBox(width: AppStyles.spaceM),
            Text(
              'Game List',
              style: AppStyles.lgsemibold(color: AppStyles.primary1),
            ),
          ],
        ),
        backgroundColor: AppStyles.black500,
        foregroundColor: AppStyles.primary1,
      ),
      body: Column(
        children: [
          _buildSearchBar(context),
          Expanded(
            child: BlocBuilder<GameListCubit, GameListState>(
              builder: (context, state) {
                return _buildBody(context, state);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppStyles.paddingXL),
      child: CustomSearchBar(
        controller: _searchController,
        onChanged: (query) => _onSearchChanged(context, query),
        onClear: () => _clearSearch(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context, GameListState state) {
    return switch (state) {
      GameInitial() => Center(
        child: Text(
          'Start typing to search games',
          style: AppStyles.smedium(color: AppStyles.black00),
        ),
      ),

      GameLoading() => const Center(
        child: CircularProgressIndicator(color: AppStyles.primary1),
      ),

      GameSuccess() =>
        state.games.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.search_off, size: 64, color: AppStyles.primary1),
                    SizedBox(height: AppStyles.spaceL),
                    Text(
                      'No games found',
                      style: AppStyles.lgsemibold(color: AppStyles.black00),
                    ),
                    SizedBox(height: AppStyles.spaceS),
                    Text(
                      'Try a different search term',
                      style: AppStyles.smedium(
                        color: AppStyles.black00.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                controller: _scrollController,
                itemCount: state.games.length + 1,
                itemBuilder: (context, index) {
                  if (index < state.games.length) {
                    final game = state.games[index];
                    return CustomCard(
                      game: game,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => GameDetailPage(gameId: game.id),
                          ),
                        );
                      },
                    );
                  } else {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: SizedBox.shrink()
                    );
                  }
                },
              ),

      GameError() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64, color: Colors.red),
            SizedBox(height: AppStyles.spaceL),
            Text(
              'Error: ${state.message}',
              style: AppStyles.smedium(color: AppStyles.black00),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppStyles.spaceXXXL),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppStyles.primary1,
              ),
              onPressed: () {
                context.read<GameListCubit>().loadGames();
              },
              child: Text(
                'Retry',
                style: AppStyles.smedium(color: AppStyles.black500),
              ),
            ),
          ],
        ),
      ),

      _ => Center(
        child: Text(
          'Unknown state',
          style: AppStyles.smedium(color: AppStyles.black00),
        ),
      ),
    };
  }
}
