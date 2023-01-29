// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_info_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeInfoEntry _$AnimeInfoEntryFromJson(Map<String, dynamic> json) =>
    AnimeInfoEntry(
      (json['pictures'] as List<dynamic>?)
          ?.map((e) => MainPicture.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['background'] as String?,
      json['id'] as int,
      json['alternativeTitles'] == null
          ? null
          : AlternativeTitles.fromJson(
              json['alternativeTitles'] as Map<String, dynamic>),
      json['averageEpisodeDuration'] as int?,
      json['broadcast'] == null
          ? null
          : Broadcast.fromJson(json['broadcast'] as Map<String, dynamic>),
      json['createdAt'] as String?,
      json['endDate'] as String?,
      (json['genres'] as List<dynamic>?)
          ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['title'] as String,
      (json['mean'] as num?)?.toDouble(),
      json['mediaType'] as String?,
      json['myListStatus'] == null
          ? null
          : MyListStatus.fromJson(json['myListStatus'] as Map<String, dynamic>),
      json['nsfw'] as String?,
      json['numEpisodes'] as int?,
      json['numListUsers'] as int?,
      json['numScoringUsers'] as int?,
      json['popularity'] as int?,
      json['rank'] as int?,
      json['rating'] as String?,
      json['source'] as String?,
      json['startDate'] as String?,
      json['startSeason'] == null
          ? null
          : Season.fromJson(json['startSeason'] as Map<String, dynamic>),
      json['status'] as String?,
      (json['studios'] as List<dynamic>?)
          ?.map((e) => AnimeStudio.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['synopsis'] as String?,
      json['mainPicture'] == null
          ? null
          : MainPicture.fromJson(json['mainPicture'] as Map<String, dynamic>),
      json['updatedAt'] as String?,
    );

Map<String, dynamic> _$AnimeInfoEntryToJson(AnimeInfoEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'mainPicture': instance.mainPicture,
      'alternativeTitles': instance.alternativeTitles,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'synopsis': instance.synopsis,
      'mean': instance.mean,
      'rank': instance.rank,
      'popularity': instance.popularity,
      'numListUsers': instance.numListUsers,
      'numScoringUsers': instance.numScoringUsers,
      'nsfw': instance.nsfw,
      'genres': instance.genres,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'mediaType': instance.mediaType,
      'status': instance.status,
      'myListStatus': instance.myListStatus,
      'numEpisodes': instance.numEpisodes,
      'startSeason': instance.startSeason,
      'broadcast': instance.broadcast,
      'source': instance.source,
      'averageEpisodeDuration': instance.averageEpisodeDuration,
      'rating': instance.rating,
      'studios': instance.studios,
      'pictures': instance.pictures,
      'background': instance.background,
    };
