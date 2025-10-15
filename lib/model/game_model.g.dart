// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameModel _$GameModelFromJson(Map<String, dynamic> json) => GameModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  backgroundImage: json['background_image'] as String?,
  rating: (json['rating'] as num?)?.toDouble(),
  released: json['released'] as String?,
  platforms: (json['platforms'] as List<dynamic>?)
      ?.map((e) => PlatformElement.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GameModelToJson(GameModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'background_image': instance.backgroundImage,
  'rating': instance.rating,
  'released': instance.released,
  'platforms': instance.platforms,
};

PlatformElement _$PlatformElementFromJson(Map<String, dynamic> json) =>
    PlatformElement(
      platform: PlatformPlatform.fromJson(
        json['platform'] as Map<String, dynamic>,
      ),
      releasedAt: json['released_at'] as String?,
    );

Map<String, dynamic> _$PlatformElementToJson(PlatformElement instance) =>
    <String, dynamic>{
      'platform': instance.platform,
      'released_at': instance.releasedAt,
    };

PlatformPlatform _$PlatformPlatformFromJson(Map<String, dynamic> json) =>
    PlatformPlatform(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      slug: json['slug'] as String,
    );

Map<String, dynamic> _$PlatformPlatformToJson(PlatformPlatform instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
    };
