// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alternative_titles.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlternativeTitles _$AlternativeTitlesFromJson(Map<String, dynamic> json) =>
    AlternativeTitles(
      (json['synonyms'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['en'] as String?,
      json['ja'] as String?,
    );

Map<String, dynamic> _$AlternativeTitlesToJson(AlternativeTitles instance) =>
    <String, dynamic>{
      'synonyms': instance.synonyms,
      'en': instance.englishTitle,
      'ja': instance.japaneseTitle,
    };
