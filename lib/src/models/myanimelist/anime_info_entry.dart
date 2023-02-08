import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:myanimelist/src/models/myanimelist/anime_list_entry.dart';
import 'package:myanimelist/src/models/myanimelist/main_picture.dart';

import 'package:myanimelist/src/models/myanimelist/genres.dart';
import 'package:myanimelist/src/models/myanimelist/related_anime_edge.dart';
import 'package:myanimelist/src/models/myanimelist/season.dart';
import 'alternative_titles.dart';
import 'anime_studio.dart';
import 'broadcast.dart';
import 'my_list_status.dart';

part "anime_info_entry.g.dart";

@JsonSerializable(fieldRename: FieldRename.snake)
class AnimeInfoEntry extends AnimeListEntry {
  List<MainPicture>? pictures;
  String? background;
  List<RelatedAnimeEdge> relatedAnime;

  AnimeInfoEntry(
      this.pictures,
      this.background,
      this.relatedAnime,
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

  factory AnimeInfoEntry.fromJson(Map<String, dynamic> json) {
    var value = _$AnimeInfoEntryFromJson(json);
    value.modifyData();

    return value;
  }
  @override
  Map<String, dynamic> toJson() => _$AnimeInfoEntryToJson(this);

  void modifyData() {
    switch (status) {
      case "finished_airing":
        status = "Finished Airing";
        break;
      case "not_yet_aired":
        status = "Not yet Aired";
        break;
      case "currently_airing":
        status = "Currently Airing";
        break;
      default:
        throw Exception("This case can't be called");
    }

    switch (mediaType) {
      case "tv":
        mediaType = "TV";
        break;
      case "ova":
        mediaType = "OVA";
        break;
      case "ona":
        mediaType = "ONA";
        break;
      default:
        mediaType = toBeginningOfSentenceCase(mediaType);
        break;
    }

    if (averageEpisodeDuration != null) {
      averageEpisodeDuration = (averageEpisodeDuration! / 60).round();
    }
  }
}
