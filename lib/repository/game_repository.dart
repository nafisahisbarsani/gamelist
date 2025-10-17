import 'package:game_list_cubit/repository/base/base_repository.dart';
import '../data/api/api_service.dart';
import '../model/response/game_response.dart';
import '../config/api_constants.dart';

class GameRepository extends BaseRepository {
  Future<GameResponse> getGames({int page = 1}) async {
    final apiService = ApiService(dio);

    return await apiService.getGames(
      apiKey: ApiConstants.apiKey,
      page: page,
    );
  }

  Future<GameResponse> searchGames(String query, {int page = 1}) async {
    final apiService = ApiService(dio);

    return await apiService.getGames(
      apiKey: ApiConstants.apiKey,
      search: query,
      page: page,
    );
  }
}