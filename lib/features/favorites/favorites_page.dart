import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../../ui/app_styles.dart';
import '../../ui/custom_card.dart';
import 'cubit/favorites_cubit.dart';
import 'cubit/favorites_state.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.black500,
      appBar: AppBar(
        title: Row(
          children: [
            SvgPicture.asset('assets/images/heart.svg'),
            SizedBox(width: AppStyles.spaceM),
            Text('Favorites', style: AppStyles.lgsemibold(color: AppStyles.primary1)),
          ],
        ),
        backgroundColor: AppStyles.black500,
        foregroundColor: AppStyles.primary1,
      ),
      body: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          if (state is FavoriteLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xFFFFC3DD)),
            );
          } else if (state is FavoriteLoaded) {
            if (state.favorites.isEmpty) {
              return Center(
                child: Text('No favorites yet', style: AppStyles.smedium(color: AppStyles.black00)),
              );
            }
            return ListView.builder(
              itemCount: state.favorites.length,
              itemBuilder: (context, index) {
                return CustomCard(game: state.favorites[index]);
              },
            );
          } else if (state is FavoriteError) {
            return Center(child: Text(state.message, style: AppStyles.smedium(color: AppStyles.black00)));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
