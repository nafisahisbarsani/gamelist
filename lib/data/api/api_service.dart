// lib/data/api/api_service.dart
import 'package:dio/dio.dart';
import '../../config/api_constants.dart';
import '../../model/response/game_detail_response.dart';
import '../../model/response/game_response.dart';
import 'package:retrofit/retrofit.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("/games")
  Future<GameResponse> getGames({
    @Query("key") required String apiKey,
    @Query("page") int? page,
    @Query("page_size") int? pageSize,
    @Query("ordering") String? ordering,
    @Query("search") String? search,
  });

  @GET("/games/{id}")
  Future<GameDetailResponse> getGameDetail(
    @Path("id") int id,
    @Query("key") String apiKey,
  );
}
