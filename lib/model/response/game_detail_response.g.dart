// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameDetailResponse _$GameDetailResponseFromJson(Map<String, dynamic> json) =>
    GameDetailResponse(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description_raw'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      released: json['released'] as String?,
      backgroundImage: json['background_image'] as String?,
      platforms: (json['platforms'] as List<dynamic>?)
          ?.map((e) => PlatformWrapper.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GameDetailResponseToJson(GameDetailResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description_raw': instance.description,
      'rating': instance.rating,
      'released': instance.released,
      'background_image': instance.backgroundImage,
      'platforms': instance.platforms,
    };

PlatformWrapper _$PlatformWrapperFromJson(Map<String, dynamic> json) =>
    PlatformWrapper(
      platform: PlatformInfo.fromJson(json['platform'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlatformWrapperToJson(PlatformWrapper instance) =>
    <String, dynamic>{'platform': instance.platform};

PlatformInfo _$PlatformInfoFromJson(Map<String, dynamic> json) =>
    PlatformInfo(name: json['name'] as String);

Map<String, dynamic> _$PlatformInfoToJson(PlatformInfo instance) =>
    <String, dynamic>{'name': instance.name};
