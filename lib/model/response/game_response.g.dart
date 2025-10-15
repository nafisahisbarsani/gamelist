// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameResponse _$GameResponseFromJson(Map<String, dynamic> json) => GameResponse(
  results: (json['results'] as List<dynamic>)
      .map((e) => GameModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GameResponseToJson(GameResponse instance) =>
    <String, dynamic>{'results': instance.results};
