import 'package:json_annotation/json_annotation.dart';

part 'main_picture.g.dart';

@JsonSerializable()
class MainPicture {
  String? large;
  String medium;

  MainPicture(this.large, this.medium);

  factory MainPicture.fromJson(Map<String, dynamic> json) => _$MainPictureFromJson(json);
  Map<String, dynamic> toJson() => _$MainPictureToJson(this);
}
