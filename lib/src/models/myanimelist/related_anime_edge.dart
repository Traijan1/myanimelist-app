import 'package:json_annotation/json_annotation.dart';

import 'node.dart';

part "related_anime_edge.g.dart";

@JsonSerializable(fieldRename: FieldRename.snake)
class RelatedAnimeEdge {
  String relationType;
  String relationTypeFormatted;
  Node node;

  RelatedAnimeEdge(this.relationType, this.relationTypeFormatted, this.node);

  factory RelatedAnimeEdge.fromJson(Map<String, dynamic> json) => _$RelatedAnimeEdgeFromJson(json);
  Map<String, dynamic> toJson() => _$RelatedAnimeEdgeToJson(this);
}
