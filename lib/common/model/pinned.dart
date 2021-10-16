import 'package:json_annotation/json_annotation.dart';

part 'pinned.g.dart';

@JsonSerializable()
class Pinned {
  String? owner;
  String? avatar;
  String? name;
  String? description;
  String? language;
  String? color;
  @JsonKey()
  int? stars;
  @JsonKey()
  int? forks;

  Pinned({
    this.owner,
    this.avatar,
    this.name,
    this.description,
    this.language,
    this.color,
    this.stars,
    this.forks,
  });

  factory Pinned.fromJson(Map<String, dynamic> json) => _$PinnedFromJson(json);
  Map<String, dynamic> toJson() => _$PinnedToJson(this);
}
