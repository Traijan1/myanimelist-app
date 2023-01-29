// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeEntry _$AnimeEntryFromJson(Map<String, dynamic> json) => AnimeEntry(
      json['id'] as int,
      json['title'] as String,
      json['main_picture'] == null
          ? null
          : MainPicture.fromJson(json['main_picture'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnimeEntryToJson(AnimeEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'main_picture': instance.mainPicture,
    };
