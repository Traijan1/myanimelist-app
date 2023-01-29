import 'package:json_annotation/json_annotation.dart';
import 'package:myanimelist/src/models/myanimelist/anime_list_entry.dart';
import 'package:myanimelist/src/models/myanimelist/main_picture.dart';

import 'package:myanimelist/src/models/myanimelist/genres.dart';
import 'package:myanimelist/src/models/myanimelist/season.dart';
import 'alternative_titles.dart';
import 'anime_studio.dart';
import 'broadcast.dart';
import 'my_list_status.dart';

part "anime_info_entry.g.dart";

@JsonSerializable()
class AnimeInfoEntry extends AnimeListEntry {
  List<MainPicture>? pictures;
  String? background;

  AnimeInfoEntry(
      this.pictures,
      this.background,
      super.id,
      super.alternativeTitles,
      super.averageEpisodeDuration,
      super.broadcast,
      super.createdAt,
      super.endDate,
      super.genres,
      super.title,
      super.mean,
      super.mediaType,
      super.myListStatus,
      super.nsfw,
      super.numEpisodes,
      super.numListUsers,
      super.numScoringUsers,
      super.popularity,
      super.rank,
      super.rating,
      super.source,
      super.startDate,
      super.startSeason,
      super.status,
      super.studios,
      super.synopsis,
      super.mainPicture,
      super.updatedAt);

  factory AnimeInfoEntry.fromJson(Map<String, dynamic> json) => _$AnimeInfoEntryFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$AnimeInfoEntryToJson(this);
}
