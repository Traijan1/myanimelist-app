import 'package:json_annotation/json_annotation.dart';
import 'package:myanimelist/src/models/myanimelist/main_picture.dart';

part "node.g.dart";

@JsonSerializable(fieldRename: FieldRename.snake)
class Node {
  int id;
  String title;
  MainPicture mainPicture;

  Node(this.id, this.title, this.mainPicture);

  factory Node.fromJson(Map<String, dynamic> json) => _$NodeFromJson(json);
  Map<String, dynamic> toJson() => _$NodeToJson(this);
}
