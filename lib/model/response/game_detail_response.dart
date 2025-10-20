import 'package:json_annotation/json_annotation.dart';

part 'game_detail_response.g.dart';

@JsonSerializable()
class GameDetailResponse {
  final int id;
  final String name;

  @JsonKey(name: 'description_raw')
  final String? description;

  final double? rating;
  final String? released;

  @JsonKey(name: 'background_image')
  final String? backgroundImage;

  final List<PlatformWrapper>? platforms;

  GameDetailResponse({
    required this.id,
    required this.name,
    this.description,
    this.rating,
    this.released,
    this.backgroundImage,
    this.platforms,
  });

  factory GameDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$GameDetailResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GameDetailResponseToJson(this);
}

@JsonSerializable()
class PlatformWrapper {
  final PlatformInfo platform;

  PlatformWrapper({required this.platform});

  factory PlatformWrapper.fromJson(Map<String, dynamic> json) =>
      _$PlatformWrapperFromJson(json);
  Map<String, dynamic> toJson() => _$PlatformWrapperToJson(this);
}

@JsonSerializable()
class PlatformInfo {
  final String name;

  PlatformInfo({required this.name});

  factory PlatformInfo.fromJson(Map<String, dynamic> json) =>
      _$PlatformInfoFromJson(json);
  Map<String, dynamic> toJson() => _$PlatformInfoToJson(this);
}
