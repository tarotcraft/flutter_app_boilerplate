import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_app_boilerplate/common/model/user.dart';
part 'repo_comment.g.dart';

@JsonSerializable()
class RepoComment {
  @JsonKey(name: 'html_url')
  String? htmlUrl;
  String? url;
  int? id;
  @JsonKey(name: 'node_id')
  String? nodeId;
  String? body;
  String? path;
  int? position;
  int? line;
  @JsonKey(name: 'commit_id')
  String? commitId;
  User? user;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  RepoComment(
      {this.htmlUrl,
        this.url,
        this.id,
        this.nodeId,
        this.body,
        this.path,
        this.position,
        this.line,
        this.commitId,
        this.user,
        this.createdAt,
        this.updatedAt});

  factory RepoComment.fromJson(Map<String, dynamic> json) => _$RepoCommentFromJson(json);
  Map<String, dynamic> toJson() => _$RepoCommentToJson(this);

}

