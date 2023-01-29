import 'package:json_annotation/json_annotation.dart';

part 'anime_studio.g.dart';

@JsonSerializable()
class AnimeStudio {
  int id;
  String name;

  AnimeStudio(this.id, this.name);

  factory AnimeStudio.fromJson(Map<String, dynamic> json) => _$AnimeStudioFromJson(json);
  Map<String, dynamic> toJson() => _$AnimeStudioToJson(this);
}
