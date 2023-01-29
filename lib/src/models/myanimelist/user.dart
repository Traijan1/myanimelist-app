import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class User {
  int id;
  String name;
  String picture;
  String? gender;
  String? birthday;
  String? location;
  String joinedAt;
  bool? isSupporter;

  User(this.id, this.name, this.picture, this.gender, this.birthday, this.location, this.joinedAt,
      this.isSupporter);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
