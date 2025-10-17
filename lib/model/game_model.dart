import 'package:json_annotation/json_annotation.dart';

part 'game_model.g.dart';

@JsonSerializable()
class GameModel {
  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "background_image")
  final String? backgroundImage;

  @JsonKey(name: "released")
  final String? released;

  @JsonKey(name: "rating")
  final double rating;

  @JsonKey(name: "platforms")
  final List<PlatformWrapper>? platforms;

  @JsonKey(name: "description_raw")
  final String? description;

  GameModel({
    required this.id,
    required this.name,
    this.backgroundImage,
    this.released,
    required this.rating,
    this.platforms,
    this.description,
  });

  factory GameModel.fromJson(Map<String, dynamic> json) =>
      _$GameModelFromJson(json);

  Map<String, dynamic> toJson() => _$GameModelToJson(this);
}

@JsonSerializable()
class PlatformWrapper {
  @JsonKey(name: "platform")
  final GamePlatform platform;

  PlatformWrapper({required this.platform});

  factory PlatformWrapper.fromJson(Map<String, dynamic> json) =>
      _$PlatformWrapperFromJson(json);

  Map<String, dynamic> toJson() => _$PlatformWrapperToJson(this);
}

@JsonSerializable()
class GamePlatform {
  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "name")
  final String name;

  GamePlatform({
    required this.id,
    required this.name,
  });

  factory GamePlatform.fromJson(Map<String, dynamic> json) =>
      _$GamePlatformFromJson(json);

  Map<String, dynamic> toJson() => _$GamePlatformToJson(this);
}
