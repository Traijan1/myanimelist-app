// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'broadcast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Broadcast _$BroadcastFromJson(Map<String, dynamic> json) => Broadcast(
      json['day_of_the_week'] as String,
      json['start_time'] as String?,
    );

Map<String, dynamic> _$BroadcastToJson(Broadcast instance) => <String, dynamic>{
      'day_of_the_week': instance.dayOfTheWeek,
      'start_time': instance.startTime,
    };
