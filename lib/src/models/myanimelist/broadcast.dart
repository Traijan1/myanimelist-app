import 'package:json_annotation/json_annotation.dart';

part 'broadcast.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Broadcast {
  String dayOfTheWeek;
  String? startTime;

  Broadcast(this.dayOfTheWeek, this.startTime);

  factory Broadcast.fromJson(Map<String, dynamic> json) => _$BroadcastFromJson(json);
  Map<String, dynamic> toJson() => _$BroadcastToJson(this);
}
