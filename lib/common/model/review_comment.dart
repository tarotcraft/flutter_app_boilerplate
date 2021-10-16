import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_app_boilerplate/common/model/user.dart';

part 'review_comment.g.dart';

@JsonSerializable()
class ReviewComment {
  String? url;
  int? id;
  @JsonKey(name: 'node_id')
  String? nodeId;
  @JsonKey(name: 'pull_request_review_id')
  int? pullRequestReviewId;
  @JsonKey(name: 'diff_hunk')
  String? diffHunk;
  String? path;
  int? position;
  @JsonKey(name: 'original_position')
  int? originalPosition;
  @JsonKey(name: 'commit_id')
  String? commitId;
  @JsonKey(name: 'original_commit_id')
  String? originalCommitId;
  @JsonKey(name: 'in_reply_to_id')
  int? inReplyToId;
  User? user;
  String? body;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'html_url')
  String? htmlUrl;
  @JsonKey(name: 'pull_request_url')
  String? pullRequestUrl;
  @JsonKey(name: 'author_association')
  String? authorAssociation;

  ReviewComment(
      {this.url,
        this.id,
        this.nodeId,
        this.pullRequestReviewId,
        this.diffHunk,
        this.path,
        this.position,
        this.originalPosition,
        this.commitId,
        this.originalCommitId,
        this.inReplyToId,
        this.user,
        this.body,
        this.createdAt,
        this.updatedAt,
        this.htmlUrl,
        this.pullRequestUrl,
        this.authorAssociation});

  factory ReviewComment.fromJson(Map<String, dynamic> json) => _$ReviewCommentFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewCommentToJson(this);

}

@JsonSerializable()
class Self {
  String? href;

  Self({this.href});

  factory Self.fromJson(Map<String, dynamic> json) => _$SelfFromJson(json);
  Map<String, dynamic> toJson() => _$SelfToJson(this);
}

@JsonSerializable()
class Html {
  String? href;

  Html({this.href});

  factory Html.fromJson(Map<String, dynamic> json) => _$HtmlFromJson(json);
  Map<String, dynamic> toJson() => _$HtmlToJson(this);
}

