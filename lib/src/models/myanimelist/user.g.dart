// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['id'] as int,
      json['name'] as String,
      json['picture'] as String,
      json['gender'] as String?,
      json['birthday'] as String?,
      json['location'] as String?,
      json['joined_at'] as String,
      json['is_supporter'] as bool?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'picture': instance.picture,
      'gender': instance.gender,
      'birthday': instance.birthday,
      'location': instance.location,
      'joined_at': instance.joinedAt,
      'is_supporter': instance.isSupporter,
    };
