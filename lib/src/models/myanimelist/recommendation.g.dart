// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommendation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recommendation _$RecommendationFromJson(Map<String, dynamic> json) =>
    Recommendation(
      json['num_recommendations'] as int,
      Node.fromJson(json['node'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RecommendationToJson(Recommendation instance) =>
    <String, dynamic>{
      'num_recommendations': instance.numRecommendations,
      'node': instance.node,
    };
