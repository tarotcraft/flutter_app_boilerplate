import 'package:json_annotation/json_annotation.dart';
part 'team.g.dart';

@JsonSerializable()
class Team {
  String? name;
  int? id;
  @JsonKey(name: 'node_id')
  String? nodeId;
  String? slug;
  String? description;
  String? privacy;
  String? url;
  @JsonKey(name: 'html_url')
  String? htmlUrl;
  @JsonKey(name: 'members_url')
  String? membersUrl;
  @JsonKey(name: 'repositories_url')
  String? repositoriesUrl;
  String? permission;

  Team(
      {this.name,
        this.id,
        this.nodeId,
        this.slug,
        this.description,
        this.privacy,
        this.url,
        this.htmlUrl,
        this.membersUrl,
        this.repositoriesUrl,
        this.permission});

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);
  Map<String, dynamic> toJson() => _$TeamToJson(this);
}