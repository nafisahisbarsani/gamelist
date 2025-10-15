import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:game_list_cubit/widgets/app_styles.dart';
import '../../widgets/custom_card.dart';
import 'cubit/games_cubit.dart';
import 'cubit/games_state.dart';

class GamesPage extends StatelessWidget {
  const GamesPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GameCubit>().loadGames();
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
      body: BlocBuilder<GameCubit, GameState>(
        builder: (context, state) {
          return _buildBody(context, state);
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, GameState state) {
    return switch (state) {
      GameInitial() => Center(
        child: Text('Pull to refresh or tap refresh button'),
      ),
      GameLoading() => const Center(child: CircularProgressIndicator()),
      GameSuccess() => ListView.builder(
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
            Text(
              'Error: ${state.message}',
              style: AppStyles.smedium(color: AppStyles.black00),
            ),
            SizedBox(height: AppStyles.spaceXXXL),
            ElevatedButton(
              onPressed: () {
                context.read<GameCubit>().loadGames();
              },
              child: Text(
                'Retry',
                style: AppStyles.smedium(color: AppStyles.black00),
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
