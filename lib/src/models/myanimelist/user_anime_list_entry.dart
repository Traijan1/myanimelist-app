import 'package:json_annotation/json_annotation.dart';
import 'package:myanimelist/src/models/myanimelist/anime_list_entry.dart';
import 'package:myanimelist/src/models/myanimelist/my_list_status.dart';

part "user_anime_list_entry.g.dart";

@JsonSerializable()
class UserAnimeListEntry {
  @JsonKey(name: "node")
  AnimeListEntry entry;
  @JsonKey(name: "list_status")
  MyListStatus status;

  UserAnimeListEntry(this.entry, this.status);

  factory UserAnimeListEntry.fromJson(Map<String, dynamic> json) =>
      _$UserAnimeListEntryFromJson(json);
  Map<String, dynamic> toJson() => _$UserAnimeListEntryToJson(this);
}
