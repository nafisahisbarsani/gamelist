import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../model/game_model.dart';
import '../features/favorites/cubit/favorites_cubit.dart';
import '../features/favorites/cubit/favorites_state.dart';
import 'app_styles.dart';

class CustomCard extends StatelessWidget {
  final GameModel game;
  final VoidCallback? onTap;

  const CustomCard({super.key, required this.game, this.onTap});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        bool isFavorite = false;
        if (state is FavoriteLoaded) {
          isFavorite = state.favorites.any((g) => g.id == game.id);
        }

        return GestureDetector(
          onTap: onTap ?? () {},
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Stack(
              children: [
                Positioned(
                  left: 3,
                  top: 25,
                  bottom: 25,
                  child: Container(
                    width: 7,
                    decoration: BoxDecoration(
                      color: AppStyles.primary1,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(AppStyles.radiusXXXL),
                        bottomLeft: const Radius.circular(AppStyles.radiusXXXL),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: AppStyles.paddingM),
                  decoration: BoxDecoration(
                    color: AppStyles.black00,
                    borderRadius: BorderRadius.circular(AppStyles.radiusXXXL),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppStyles.paddingL,
                      vertical: AppStyles.paddingL,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                            AppStyles.radiusXXXL,
                          ),
                          child: game.backgroundImage != null
                              ? Image.network(
                                  game.backgroundImage!,
                                  width: 105,
                                  height: 86,
                                  fit: BoxFit.cover,
                                )
                              : Container(
                                  width: 105,
                                  height: 86,
                                  color: AppStyles.black00,
                                  child: const Icon(Icons.image_not_supported),
                                ),
                        ),
                        SizedBox(width: AppStyles.spaceXXXL),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      game.name,
                                      style: AppStyles.ssemibold(
                                        color: AppStyles.black500,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      isFavorite
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: AppStyles.primary1,
                                      size: AppStyles.iconL,
                                    ),
                                    onPressed: () {
                                      context
                                          .read<FavoriteCubit>()
                                          .toggleFavorite(game);
                                    },
                                  ),
                                ],
                              ),
                              if (game.released != null)
                                Text(
                                  'Released: ${_formatDate(game.released!)}',
                                  style: AppStyles.xsregular(
                                    color: AppStyles.black500,
                                  ),
                                ),
                              SizedBox(height: AppStyles.spaceXS),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Platforms: ${_getPlatformNames(game.platforms ?? [])}',
                                      style: AppStyles.xsregular(
                                        color: AppStyles.black500,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  if (game.rating != null)
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/images/star.svg',
                                        ),
                                        SizedBox(width: AppStyles.spaceXS),
                                        Text(
                                          game.rating.toStringAsFixed(2),
                                          style: AppStyles.xsregular(
                                            color: AppStyles.black500,
                                          ),
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String _getPlatformNames(List<dynamic> platforms) {
    if (platforms.isEmpty) return '-';
    return platforms.take(2).map((p) => p.platform.name).join(', ');
  }

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
    } catch (_) {
      return dateString;
    }
  }
}
