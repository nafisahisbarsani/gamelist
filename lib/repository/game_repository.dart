import 'package:dio/dio.dart';
import '../data/api/api_service.dart';
import '../model/response/game_response.dart';
import '../../config/api_constants.dart';

class GameRepository {
  Future<GameResponse> getGames() async {
    final dio = Dio();
    final apiService = ApiService(dio);

    return await apiService.getGames(
      apiKey: ApiConstants.apiKey,
    );
  }
}