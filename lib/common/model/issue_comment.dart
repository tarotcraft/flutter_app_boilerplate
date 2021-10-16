import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_app_boilerplate/common/model/user.dart';
part 'issue_comment.g.dart';

@JsonSerializable()
class IssueComment {
  int? id;
  @JsonKey(name: 'node_id')
  String? nodeId;
  String? url;
  @JsonKey(name: 'html_url')
  String? htmlUrl;
  String? body;
  User? user;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  IssueComment(
      {this.id,
        this.nodeId,
        this.url,
        this.htmlUrl,
        this.body,
        this.user,
        this.createdAt,
        this.updatedAt});

  factory IssueComment.fromJson(Map<String, dynamic> json) => _$IssueCommentFromJson(json);
  Map<String, dynamic> toJson() => _$IssueCommentToJson(this);

}

