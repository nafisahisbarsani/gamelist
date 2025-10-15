// lib/data/models/response/game_response.dart
import 'package:json_annotation/json_annotation.dart';
import '../game_model.dart';

part 'game_response.g.dart';

@JsonSerializable()
class GameResponse {
  @JsonKey(name: "results")
  final List<GameModel> results;

  GameResponse({
    required this.results,
  });

  factory GameResponse.fromJson(Map<String, dynamic> json) => _$GameResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GameResponseToJson(this);
}