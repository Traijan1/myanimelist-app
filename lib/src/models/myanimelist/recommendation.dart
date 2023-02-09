import 'package:json_annotation/json_annotation.dart';

import 'node.dart';

part "recommendation.g.dart";

@JsonSerializable(fieldRename: FieldRename.snake)
class Recommendation {
  int numRecommendations;
  Node node;

  Recommendation(this.numRecommendations, this.node);

  factory Recommendation.fromJson(Map<String, dynamic> json) => _$RecommendationFromJson(json);
  Map<String, dynamic> toJson() => _$RecommendationToJson(this);
}
