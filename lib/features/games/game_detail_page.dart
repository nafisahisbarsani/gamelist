import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../repository/game_repository.dart';
import '../../ui/app_styles.dart';
import '../../ui/custom_arrow.dart';
import 'cubit/game_detail_cubit.dart';
import 'cubit/game_detail_state.dart';

class GameDetailPage extends StatelessWidget {
  final int gameId;

  const GameDetailPage({super.key, required this.gameId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GameDetailCubit(GameRepository())..fetchGameDetail(gameId),
      child: Scaffold(
        backgroundColor: AppStyles.black500,
        body: SafeArea(
          child: Column(
            children: [
              CustomArrow(title: "Detail"),
              Expanded(
                child: BlocBuilder<GameDetailCubit, GameDetailState>(
                  builder: (context, state) {
                    if (state is GameDetailLoading) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppStyles.primary1,
                        ),
                      );
                    } else if (state is GameDetailError) {
                      return Center(
                        child: Text(
                          'Error: ${state.message}',
                          style: const TextStyle(color: Colors.red),
                        ),
                      );
                    } else if (state is GameDetailSuccess) {
                      final game = state.gameDetail;
                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildHeader(game.backgroundImage),
                            _buildTitle(game.name),
                            SizedBox(height: AppStyles.spaceXXXXL),
                            _buildInfoRow(
                              rating: game.rating?.toString() ?? "-",
                              released: game.released ?? "-",
                              platforms:
                                  game.platforms
                                      ?.map((p) => p.platform.name)
                                      .join(", ") ??
                                  "-",
                            ),
                            _buildDescription(game.description),
                          ],
                        ),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppStyles.primary1,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(String? imageUrl) {
    return Container(
      height: 200,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppStyles.radiusXXXL),
        image: imageUrl != null && imageUrl.isNotEmpty
            ? DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover)
            : null,
      ),
    );
  }

  Widget _buildTitle(String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: AppStyles.lgsemibold(color: AppStyles.black00),
            ),
          ),
          Icon(Icons.favorite_border, color: AppStyles.primary1, size: 24),
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required String rating,
    required String released,
    required String platforms,
  }) {
    final truncatedPlatforms = _simplifyPlatforms(platforms);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppStyles.paddingXL),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: _buildInfoItem('assets/images/rating.svg', rating)),
          Expanded(
            child: _buildInfoItem('assets/images/release.svg', released),
          ),
          Expanded(
            child: _buildInfoItem(
              'assets/images/platform.svg',
              truncatedPlatforms,
            ),
          ),
        ],
      ),
    );
  }

  String _simplifyPlatforms(String platforms) {
    final platformsList = platforms.split(', ');
    if (platformsList.length <= 2) return platforms;

    return '${platformsList.take(2).join(', ')} +${platformsList.length - 2}';
  }

  Widget _buildInfoItem(String iconPath, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(iconPath),
          SizedBox(height: AppStyles.spaceM),
          Text(
            value,
            style: AppStyles.xsmedium(color: AppStyles.black00),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildDescription(String? description) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppStyles.paddingXL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppStyles.spaceXXXXL),
          Text(
            "Description",
            style: AppStyles.ssemibold(color: AppStyles.black00),
          ),
          SizedBox(height: AppStyles.spaceS),
          Text(
            description ?? "No description available.",
            style: AppStyles.sregular(color: AppStyles.black00),
          ),
          SizedBox(height: AppStyles.spaceXXXXL),
        ],
      ),
    );
  }
}
