import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_app_boilerplate/common/model/label.dart';
import 'package:flutter_app_boilerplate/common/model/milestone.dart';
import 'package:flutter_app_boilerplate/common/model/user.dart';
part 'issue.g.dart';

@JsonSerializable()
class Issue {
  String? url;
  @JsonKey(name: 'repository_url')
  String? repositoryUrl;
  @JsonKey(name: 'labels_url')
  String? labelsUrl;
  @JsonKey(name: 'comments_url')
  String? commentsUrl;
  @JsonKey(name: 'events_url')
  String? eventsUrl;
  @JsonKey(name: 'html_url')
  String? htmlUrl;
  int? id;
  @JsonKey(name: 'node_id')
  String? nodeId;
  int? number;
  String? title;
  User? user;
  List<Label>? labels;
  String? state;
  bool? locked;
  User? assignee;
  List<User>? assignees;
  Milestone? milestone;
  int? comments;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'closed_at')
  String? closedAt;
  @JsonKey(name: 'author_association')
  String? authorAssociation;
  String? body;

  Issue(
      {this.url,
        this.repositoryUrl,
        this.labelsUrl,
        this.commentsUrl,
        this.eventsUrl,
        this.htmlUrl,
        this.id,
        this.nodeId,
        this.number,
        this.title,
        this.user,
        this.labels,
        this.state,
        this.locked,
        this.assignee,
        this.assignees,
        this.milestone,
        this.comments,
        this.createdAt,
        this.updatedAt,
        this.closedAt,
        this.authorAssociation,
        this.body});

  factory Issue.fromJson(Map<String, dynamic> json) => _$IssueFromJson(json);
  Map<String, dynamic> toJson() => _$IssueToJson(this);

}
