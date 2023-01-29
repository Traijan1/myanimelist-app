import 'package:json_annotation/json_annotation.dart';

part 'alternative_titles.g.dart';

@JsonSerializable()
class AlternativeTitles {
  List<String>? synonyms;
  @JsonKey(name: "en")
  String? englishTitle;
  @JsonKey(name: "ja")
  String? japaneseTitle;

  AlternativeTitles(this.synonyms, this.englishTitle, this.japaneseTitle);

  factory AlternativeTitles.fromJson(Map<String, dynamic> json) =>
      _$AlternativeTitlesFromJson(json);
  Map<String, dynamic> toJson() => _$AlternativeTitlesToJson(this);
}
