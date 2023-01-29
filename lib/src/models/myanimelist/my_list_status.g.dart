// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_list_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyListStatus _$MyListStatusFromJson(Map<String, dynamic> json) => MyListStatus(
      json['status'] as String?,
      json['score'] as int,
      json['num_episodes_watched'] as int,
      json['is_rewatching'] as bool,
      json['start_day'] as String?,
      json['finish_day'] as String?,
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$MyListStatusToJson(MyListStatus instance) =>
    <String, dynamic>{
      'status': instance.status,
      'score': instance.score,
      'num_episodes_watched': instance.numEpisodesWatched,
      'is_rewatching': instance.isRewatching,
      'start_day': instance.startDay,
      'finish_day': instance.finishDay,
      'tags': instance.tags,
    };
