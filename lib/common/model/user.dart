import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String? login;
  int? id;
  @JsonKey(name: 'node_id')
  String? nodeId;
  @JsonKey(name: 'avatar_url')
  String? avatarUrl;
  @JsonKey(name: 'gravatar_id')
  String? gravatarId;
  String? url;
  @JsonKey(name: 'html_url')
  String? htmlUrl;
  String? type;
  @JsonKey(name: 'site_admin')
  bool? siteAdmin;

  User({
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
    this.gravatarId,
    this.url,
    this.htmlUrl,
    this.type,
    this.siteAdmin,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
