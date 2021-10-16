import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_app_boilerplate/common/model/tree.dart';
import 'package:flutter_app_boilerplate/common/model/user.dart';
part 'commits.g.dart';

@JsonSerializable()
class Commits {
  String? url;
  String? sha;
  @JsonKey(name: 'node_id')
  String? nodeId;
  @JsonKey(name: 'html_url')
  String? htmlUrl;
  @JsonKey(name: 'comments_url')
  String? commentsUrl;
  Commit? commit;
  User? author;
  User? committer;
  List<Parents>? parents;

  Commits(
      {this.url,
        this.sha,
        this.nodeId,
        this.htmlUrl,
        this.commentsUrl,
        this.commit,
        this.author,
        this.committer,
        this.parents});

  factory Commits.fromJson(Map<String, dynamic> json) => _$CommitsFromJson(json);
  Map<String, dynamic> toJson() => _$CommitsToJson(this);

}

@JsonSerializable()
class Commit {
  String? url;
  Author? author;
  Author? committer;
  String? message;
  Tree? tree;
  @JsonKey(name: 'comment_count')
  int? commentCount;
  Verification? verification;

  Commit(
      {this.url,
        this.author,
        this.committer,
        this.message,
        this.tree,
        this.commentCount,
        this.verification});

  factory Commit.fromJson(Map<String, dynamic> json) => _$CommitFromJson(json);
  Map<String, dynamic> toJson() => _$CommitToJson(this);

}

@JsonSerializable()
class Author {
  String? name;
  String? email;
  String? date;

  Author({this.name, this.email, this.date});

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);
  Map<String, dynamic> toJson() => _$AuthorToJson(this);

}

@JsonSerializable()
class Verification {
  bool? verified;
  String? reason;
  String? signature;
  String? payload;

  Verification({this.verified, this.reason, this.signature, this.payload});

  factory Verification.fromJson(Map<String, dynamic> json) => _$VerificationFromJson(json);
  Map<String, dynamic> toJson() => _$VerificationToJson(this);

}

@JsonSerializable()
class Parents {
  String? url;
  String? sha;

  Parents(
      {this.url,
        this.sha});

  factory Parents.fromJson(Map<String, dynamic> json) => _$ParentsFromJson(json);
  Map<String, dynamic> toJson() => _$ParentsToJson(this);

}
