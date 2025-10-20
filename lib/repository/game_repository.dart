import 'package:dio/dio.dart';
import '../data/api/api_service.dart';
import '../model/response/game_response.dart';
import '../model/response/game_detail_response.dart';
import '../config/api_constants.dart';
import 'base/base_repository.dart';

class GameRepository extends BaseRepository {
  final ApiService _apiService;

  GameRepository(Dio dio) : _apiService = ApiService(dio);

  Future<GameResponse> getGames({int page = 1}) async {
    return await _apiService.getGames(
      apiKey: ApiConstants.apiKey,
      page: page,
    );
  }

  Future<GameResponse> searchGames(String query, {int page = 1}) async {
    return await _apiService.getGames(
      apiKey: ApiConstants.apiKey,
      search: query,
      page: page,
    );
  }

  Future<GameDetailResponse> getGameDetail(int id) async {
    return await _apiService.getGameDetail(id, ApiConstants.apiKey);
  }
}
