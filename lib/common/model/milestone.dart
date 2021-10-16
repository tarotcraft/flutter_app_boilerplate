import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_app_boilerplate/common/model/user.dart';
part 'milestone.g.dart';

@JsonSerializable()
class Milestone {
  String? url;
  @JsonKey(name: 'html_url')
  String? htmlUrl;
  @JsonKey(name: 'labels_url')
  String? labelsUrl;
  int? id;
  @JsonKey(name: 'node_id')
  String? nodeId;
  int? number;
  String? title;
  String? description;
  User? creator;
  @JsonKey(name: 'open_issues')
  int? openIssues;
  @JsonKey(name: 'closed_issues')
  int? closedIssues;
  String? state;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'due_on')
  String? dueOn;
  @JsonKey(name: 'closed_at')
  String? closedAt;

  Milestone(
      {this.url,
        this.htmlUrl,
        this.labelsUrl,
        this.id,
        this.nodeId,
        this.number,
        this.title,
        this.description,
        this.creator,
        this.openIssues,
        this.closedIssues,
        this.state,
        this.createdAt,
        this.updatedAt,
        this.dueOn,
        this.closedAt});

  factory Milestone.fromJson(Map<String, dynamic> json) => _$MilestoneFromJson(json);
  Map<String, dynamic> toJson() => _$MilestoneToJson(this);
}
