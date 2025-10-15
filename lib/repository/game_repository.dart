// repository/game_repository.dart
import 'package:dio/dio.dart';
import 'package:game_list_cubit/repository/base/base_repository.dart';
import '../data/api/api_service.dart';
import '../model/response/game_response.dart';
import '../config/api_constants.dart';

class GameRepository extends BaseRepository {

  Future<GameResponse> getGames() async {
    final apiService = ApiService(dio);

    return await apiService.getGames(
      apiKey: ApiConstants.apiKey,
    );
  }

  Future<GameResponse> searchGames(String query) async {
    final apiService = ApiService(dio);

    return await apiService.getGames(
      apiKey: ApiConstants.apiKey,
      search: query,
    );
  }
}