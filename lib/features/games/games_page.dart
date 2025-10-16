import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:game_list_cubit/widgets/app_styles.dart';
import 'package:game_list_cubit/widgets/custom_search_bar.dart';
import '../../widgets/custom_card.dart';
import 'cubit/games_cubit.dart';
import 'cubit/games_state.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';


class GamesPage extends StatefulWidget {
  const GamesPage({super.key});

  @override
  State<GamesPage> createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GameCubit>().loadGames();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (_debounceTimer?.isActive ?? false) {
      _debounceTimer?.cancel();
    }

    // Start new timer
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      if (query.isEmpty) {
        context.read<GameCubit>().loadGames();
      } else {
        context.read<GameCubit>().searchGames(query);
      }
    });
  }

  void _clearSearch() {
    _searchController.clear();
    context.read<GameCubit>().loadGames();
  }

  @override
  Widget build(BuildContext context) {
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
          _buildSearchBar(),
          Expanded(
            child: BlocBuilder<GameCubit, GameState>(
              builder: (context, state) {
                return _buildBody(state);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(AppStyles.paddingXXL),
      child: CustomSearchBar(
        controller: _searchController,
        onChanged: _onSearchChanged,
        onClear: _clearSearch,
      ),
    );
  }

  Widget _buildBody(GameState state){
    return switch (state) {
      GameInitial() => Center(
        child: Text(
          'Start typing to search games',
          style: AppStyles.smedium(color: AppStyles.black00),
        ),
      ),

      GameLoading() => const Center(
        child: CircularProgressIndicator(
          color: Color(0xFFFFC3DD),
        ),
      ),

      GameSuccess() => state.games.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off,
              size: 64,
              color: AppStyles.primary1,
            ),
            SizedBox(height: AppStyles.spaceL),
            Text(
              'No games found',
              style: AppStyles.lgsemibold(color: AppStyles.black00),
            ),
            SizedBox(height: AppStyles.spaceS),
            Text(
              'Try a different search term',
              style: AppStyles.smedium(
                  color: AppStyles.black00.withOpacity(0.7)),
            ),
          ],
        ),
      )
          : ListView.builder(
        itemCount: state.games.length,
        itemBuilder: (context, index) {
          final game = state.games[index];
          return CustomCard(game: game);
        },
      ),

      GameError() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red,
            ),
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
                context.read<GameCubit>().loadGames();
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
