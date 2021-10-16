import 'package:json_annotation/json_annotation.dart';

part 'user_detail.g.dart';

@JsonSerializable()
class UserDetail {
  String? login;
  int? id;
  @JsonKey(name: 'node_id')
  String? nodeId;
  @JsonKey(name: 'avatar_url')
  String? avatarUrl;
  @JsonKey(name: 'gravatar_id')
  String? gravatarId;
  String? url;
  String? type;
  @JsonKey(name: 'site_admin')
  bool? siteAdmin;
  String? name;
  String? company;
  String? blog;
  String? location;
  String? email;
  bool? hireable;
  String? bio;
  @JsonKey(name: 'public_repos')
  int? publicRepos;
  @JsonKey(name: 'public_gists')
  int? publicGists;
  int? followers;
  int? following;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  UserDetail({
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
    this.gravatarId,
    this.url,
    this.type,
    this.siteAdmin,
    this.name,
    this.company,
    this.blog,
    this.location,
    this.email,
    this.hireable,
    this.bio,
    this.publicRepos,
    this.publicGists,
    this.followers,
    this.following,
    this.createdAt,
    this.updatedAt,
  });

  factory UserDetail.fromJson(Map<String, dynamic> json) =>
      _$UserDetailFromJson(json);

  Map<String, dynamic> toJson() => _$UserDetailToJson(this);
}
