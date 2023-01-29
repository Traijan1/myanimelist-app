// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_list_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeListEntry _$AnimeListEntryFromJson(Map<String, dynamic> json) =>
    AnimeListEntry(
      json['id'] as int,
      json['alternative_titles'] == null
          ? null
          : AlternativeTitles.fromJson(
              json['alternative_titles'] as Map<String, dynamic>),
      json['average_episode_duration'] as int?,
      json['broadcast'] == null
          ? null
          : Broadcast.fromJson(json['broadcast'] as Map<String, dynamic>),
      json['created_at'] as String?,
      json['end_date'] as String?,
      (json['genres'] as List<dynamic>?)
          ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['title'] as String,
      (json['mean'] as num?)?.toDouble(),
      json['media_type'] as String?,
      json['my_list_status'] == null
          ? null
          : MyListStatus.fromJson(
              json['my_list_status'] as Map<String, dynamic>),
      json['nsfw'] as String?,
      json['num_episodes'] as int?,
      json['num_list_users'] as int?,
      json['num_scoring_users'] as int?,
      json['popularity'] as int?,
      json['rank'] as int?,
      json['rating'] as String?,
      json['source'] as String?,
      json['start_date'] as String?,
      json['start_season'] == null
          ? null
          : Season.fromJson(json['start_season'] as Map<String, dynamic>),
      json['status'] as String?,
      (json['studios'] as List<dynamic>?)
          ?.map((e) => AnimeStudio.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['synopsis'] as String?,
      json['main_picture'] == null
          ? null
          : MainPicture.fromJson(json['main_picture'] as Map<String, dynamic>),
      json['updated_at'] as String?,
    );

Map<String, dynamic> _$AnimeListEntryToJson(AnimeListEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'main_picture': instance.mainPicture,
      'alternative_titles': instance.alternativeTitles,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'synopsis': instance.synopsis,
      'mean': instance.mean,
      'rank': instance.rank,
      'popularity': instance.popularity,
      'num_list_users': instance.numListUsers,
      'num_scoring_users': instance.numScoringUsers,
      'nsfw': instance.nsfw,
      'genres': instance.genres,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'media_type': instance.mediaType,
      'status': instance.status,
      'my_list_status': instance.myListStatus,
      'num_episodes': instance.numEpisodes,
      'start_season': instance.startSeason,
      'broadcast': instance.broadcast,
      'source': instance.source,
      'average_episode_duration': instance.averageEpisodeDuration,
      'rating': instance.rating,
      'studios': instance.studios,
    };
