// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'related_anime_edge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RelatedAnimeEdge _$RelatedAnimeEdgeFromJson(Map<String, dynamic> json) =>
    RelatedAnimeEdge(
      json['relation_type'] as String,
      json['relation_type_formatted'] as String,
      Node.fromJson(json['node'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RelatedAnimeEdgeToJson(RelatedAnimeEdge instance) =>
    <String, dynamic>{
      'relation_type': instance.relationType,
      'relation_type_formatted': instance.relationTypeFormatted,
      'node': instance.node,
    };
