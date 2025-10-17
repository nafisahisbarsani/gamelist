// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameModel _$GameModelFromJson(Map<String, dynamic> json) => GameModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  backgroundImage: json['background_image'] as String?,
  released: json['released'] as String?,
  rating: (json['rating'] as num).toDouble(),
  platforms: (json['platforms'] as List<dynamic>?)
      ?.map((e) => PlatformWrapper.fromJson(e as Map<String, dynamic>))
      .toList(),
  description: json['description_raw'] as String?,
);

Map<String, dynamic> _$GameModelToJson(GameModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'background_image': instance.backgroundImage,
  'released': instance.released,
  'rating': instance.rating,
  'platforms': instance.platforms,
  'description_raw': instance.description,
};

PlatformWrapper _$PlatformWrapperFromJson(Map<String, dynamic> json) =>
    PlatformWrapper(
      platform: GamePlatform.fromJson(json['platform'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlatformWrapperToJson(PlatformWrapper instance) =>
    <String, dynamic>{'platform': instance.platform};

GamePlatform _$GamePlatformFromJson(Map<String, dynamic> json) =>
    GamePlatform(id: (json['id'] as num).toInt(), name: json['name'] as String);

Map<String, dynamic> _$GamePlatformToJson(GamePlatform instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
