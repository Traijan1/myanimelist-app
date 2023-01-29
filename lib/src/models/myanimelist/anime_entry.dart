import 'package:json_annotation/json_annotation.dart';
import 'package:myanimelist/src/models/myanimelist/alternative_titles.dart';
import 'package:myanimelist/src/models/myanimelist/main_picture.dart';

part "anime_entry.g.dart";

@JsonSerializable(fieldRename: FieldRename.snake)
class AnimeEntry {
  int id;
  String title;
  MainPicture? mainPicture;

  AnimeEntry(this.id, this.title, this.mainPicture);

  factory AnimeEntry.fromJson(Map<String, dynamic> json) => _$AnimeEntryFromJson(json);
  Map<String, dynamic> toJson() => _$AnimeEntryToJson(this);
}
