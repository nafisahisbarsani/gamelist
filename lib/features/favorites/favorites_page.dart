import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../../ui/app_styles.dart';
import '../../ui/custom_card.dart';
import '../games/game_detail_page.dart';
import 'cubit/favorites_cubit.dart';
import 'cubit/favorites_state.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.microtask(() => context.read<FavoriteCubit>().loadFavorites());
    return Scaffold(
      backgroundColor: AppStyles.black500,
      appBar: AppBar(
        backgroundColor: AppStyles.black500,
        foregroundColor: AppStyles.primary1,
        title: Row(
          children: [
            SvgPicture.asset('assets/images/heart.svg'),
            SizedBox(width: AppStyles.spaceM),
            Text(
              'Favorite',
              style: AppStyles.mlsemibold(color: AppStyles.primary1),
            ),
          ],
        ),
      ),
      body: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          if (state is FavoriteLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppStyles.primary1),
            );
          } else if (state is FavoriteLoaded) {
            final favorites = state.favorites;

            if (favorites.isEmpty) {
              return Center(
                child: Text(
                  'No favorites yet',
                  style: AppStyles.smedium(color: AppStyles.black00),
                ),
              );
            }

            return ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final game = favorites[index];
                return CustomCard(
                  game: game,
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => GameDetailPage(gameId: game.id),
                      ),
                    );
                    context.read<FavoriteCubit>().loadFavorites();
                  },
                );
              },
            );
          } else if (state is FavoriteError) {
            return Center(
              child: Text(
                state.message,
                style: AppStyles.smedium(color: AppStyles.black00),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
