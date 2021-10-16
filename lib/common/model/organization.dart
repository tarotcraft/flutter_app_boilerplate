import 'package:json_annotation/json_annotation.dart';
part 'organization.g.dart';

@JsonSerializable()
class Organization {
  String? login;
  int? id;
  @JsonKey(name: 'node_id')
  String? nodeId;
  String? url;
  @JsonKey(name: 'repos_url')
  String? reposUrl;
  @JsonKey(name: 'events_url')
  String? eventsUrl;
  @JsonKey(name: 'hooks_url')
  String? hooksUrl;
  @JsonKey(name: 'issues_url')
  String? issuesUrl;
  @JsonKey(name: 'members_url')
  String? membersUrl;
  @JsonKey(name: 'public_members_url')
  String? publicMembersUrl;
  @JsonKey(name: 'avatar_url')
  String? avatarUrl;
  String? description;

  Organization(
      {this.login,
        this.id,
        this.nodeId,
        this.url,
        this.reposUrl,
        this.eventsUrl,
        this.hooksUrl,
        this.issuesUrl,
        this.membersUrl,
        this.publicMembersUrl,
        this.avatarUrl,
        this.description});

  factory Organization.fromJson(Map<String, dynamic> json) => _$OrganizationFromJson(json);
  Map<String, dynamic> toJson() => _$OrganizationToJson(this);

}