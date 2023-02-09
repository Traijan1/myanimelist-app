// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Node _$NodeFromJson(Map<String, dynamic> json) => Node(
      json['id'] as int,
      json['title'] as String,
      MainPicture.fromJson(json['main_picture'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NodeToJson(Node instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'main_picture': instance.mainPicture,
    };
