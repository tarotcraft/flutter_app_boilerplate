import 'package:json_annotation/json_annotation.dart';
part 'contributor.g.dart';

@JsonSerializable()
class Contributor {
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
  int? contributions;

  Contributor(
      {this.login,
        this.id,
        this.nodeId,
        this.avatarUrl,
        this.gravatarId,
        this.url,
        this.htmlUrl,
        this.type,
        this.siteAdmin,
        this.contributions});

  factory Contributor.fromJson(Map<String, dynamic> json) => _$ContributorFromJson(json);
  Map<String, dynamic> toJson() => _$ContributorToJson(this);

}
