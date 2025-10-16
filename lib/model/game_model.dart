import 'package:json_annotation/json_annotation.dart';

part 'game_model.g.dart';

@JsonSerializable()
class GameModel {
  final int id;
  final String name;

  @JsonKey(name: "background_image")
  final String? backgroundImage;

  final double? rating;
  final String? released;
  final List<PlatformElement>? platforms;

  GameModel({
    required this.id,
    required this.name,
    this.backgroundImage,
    this.rating,
    this.released,
    this.platforms,
  });

  factory GameModel.fromJson(Map<String, dynamic> json) => _$GameModelFromJson(json);
  Map<String, dynamic> toJson() => _$GameModelToJson(this);


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'background_image': backgroundImage,
      'released': released,
      'rating': rating,
    };
  }

  factory GameModel.fromMap(Map<String, dynamic> map) {
    return GameModel(
      id: map['id'],
      name: map['name'],
      backgroundImage: map['background_image'],
      released: map['released'],
      rating: map['rating'] != null ? (map['rating'] as num).toDouble() : null,
      platforms: null, // SQLite won't store platforms for now
    );
  }
}

@JsonSerializable()
class PlatformElement {
  final PlatformPlatform platform;

  @JsonKey(name: "released_at")
  final String? releasedAt;

  PlatformElement({
    required this.platform,
    this.releasedAt,
  });

  factory PlatformElement.fromJson(Map<String, dynamic> json) => _$PlatformElementFromJson(json);
  Map<String, dynamic> toJson() => _$PlatformElementToJson(this);
}

@JsonSerializable()
class PlatformPlatform {
  final int id;
  final String name;
  final String slug;

  PlatformPlatform({
    required this.id,
    required this.name,
    required this.slug,
  });

  factory PlatformPlatform.fromJson(Map<String, dynamic> json) => _$PlatformPlatformFromJson(json);
  Map<String, dynamic> toJson() => _$PlatformPlatformToJson(this);
}
