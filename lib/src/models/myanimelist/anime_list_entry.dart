import 'package:intl/intl.dart' show toBeginningOfSentenceCase;
import 'package:json_annotation/json_annotation.dart';
import 'package:myanimelist/src/models/myanimelist/anime_entry.dart';
import 'package:myanimelist/src/models/myanimelist/genres.dart';
import 'package:myanimelist/src/models/myanimelist/main_picture.dart';
import 'package:myanimelist/src/models/myanimelist/season.dart';

import 'alternative_titles.dart';
import 'anime_studio.dart';
import 'broadcast.dart';
import 'my_list_status.dart';

part 'anime_list_entry.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AnimeListEntry extends AnimeEntry {
  AlternativeTitles? alternativeTitles;
  String? startDate;
  String? endDate;
  String? synopsis;
  double? mean;
  int? rank;
  int? popularity;
  int? numListUsers;
  int? numScoringUsers;
  String? nsfw;
  List<Genre>? genres;
  String? createdAt;
  String? updatedAt;
  String? mediaType;
  String? status;
  MyListStatus? myListStatus;
  int? numEpisodes;
  Season? startSeason;
  Broadcast? broadcast;
  String? source;
  int? averageEpisodeDuration;
  String? rating;
  List<AnimeStudio>? studios;

  AnimeListEntry(
      super.id,
      this.alternativeTitles,
      this.averageEpisodeDuration,
      this.broadcast,
      this.createdAt,
      this.endDate,
      this.genres,
      super.title,
      this.mean,
      this.mediaType,
      this.myListStatus,
      this.nsfw,
      this.numEpisodes,
      this.numListUsers,
      this.numScoringUsers,
      this.popularity,
      this.rank,
      this.rating,
      this.source,
      this.startDate,
      this.startSeason,
      this.status,
      this.studios,
      this.synopsis,
      super.mainPicture,
      this.updatedAt);

  factory AnimeListEntry.fromJson(Map<String, dynamic> json) {
    var entry = _$AnimeListEntryFromJson(json);
    entry.modifyValues();

    return entry;
  }

  @override
  Map<String, dynamic> toJson() => _$AnimeListEntryToJson(this);

  void modifyValues() {
    if (mediaType == null) return;

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

    if (startSeason == null) return;
    startSeason!.season = toBeginningOfSentenceCase(startSeason!.season)!;
  }
}
