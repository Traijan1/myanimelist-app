import 'package:intl/intl.dart' show toBeginningOfSentenceCase;
import 'package:json_annotation/json_annotation.dart';

part 'my_list_status.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MyListStatus {
  String? status;
  int score;
  int numEpisodesWatched;
  bool isRewatching;
  String? startDay;
  String? finishDay;
  List<String>? tags;

  MyListStatus(this.status, this.score, this.numEpisodesWatched, this.isRewatching, this.startDay,
      this.finishDay, this.tags);

  factory MyListStatus.fromJson(Map<String, dynamic> json) => _$MyListStatusFromJson(json);

  Map<String, dynamic> toJson() => _$MyListStatusToJson(this);
}
