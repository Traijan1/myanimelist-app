// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_anime_list_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAnimeListEntry _$UserAnimeListEntryFromJson(Map<String, dynamic> json) =>
    UserAnimeListEntry(
      AnimeListEntry.fromJson(json['node'] as Map<String, dynamic>),
      MyListStatus.fromJson(json['list_status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserAnimeListEntryToJson(UserAnimeListEntry instance) =>
    <String, dynamic>{
      'node': instance.entry,
      'list_status': instance.status,
    };
