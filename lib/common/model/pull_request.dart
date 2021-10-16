import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_app_boilerplate/common/model/milestone.dart';
import 'package:flutter_app_boilerplate/common/model/repository.dart';
import 'package:flutter_app_boilerplate/common/model/user.dart';
import 'package:flutter_app_boilerplate/common/model/label.dart';
part 'pull_request.g.dart';

@JsonSerializable()
class PullRequest {
  String? url;
  int? id;
  @JsonKey(name: 'node_id')
  String? nodeId;
  @JsonKey(name: 'html_url')
  String? htmlUrl;
  @JsonKey(name: 'diff_url')
  String? diffUrl;
  @JsonKey(name: 'patch_url')
  String? patchUrl;
  @JsonKey(name: 'issue_url')
  String? issueUrl;
  int? number;
  String? state;
  bool? locked;
  String? title;
  User? user;
  String? body;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'closed_at')
  String? closedAt;
  @JsonKey(name: 'merged_at')
  String? mergedAt;
  @JsonKey(name: 'merge_commit_sha')
  String? mergeCommitSha;
  User? assignee;
  List<User>? assignees;
  @JsonKey(name: 'requested_reviewers')
  List<User>? requestedReviewers;
  @JsonKey(name: 'requested_teams')
  List<Team>? requestedTeams;
  List<Label>? labels;
  Milestone? milestone;
  @JsonKey(name: 'commits_url')
  String? commitsUrl;
  @JsonKey(name: 'review_comments_url')
  String? reviewCommentsUrl;
  @JsonKey(name: 'review_comment_url')
  String? reviewCommentUrl;
  @JsonKey(name: 'comments_url')
  String? commentsUrl;
  @JsonKey(name: 'statuses_url')
  String? statusesUrl;
  Head? head;
  Head? base;
  @JsonKey(name: 'author_association')
  String? authorAssociation;
  bool? draft;
  bool? merged;
  bool? mergeable;
  bool? rebaseable;
  @JsonKey(name: 'mergeable_state')
  String? mergeableState;
  @JsonKey(name: 'merged_by')
  User? mergedBy;
  int? comments;
  @JsonKey(name: 'review_comments')
  int? reviewComments;
  @JsonKey(name: 'maintainer_can_modify')
  bool? maintainerCanModify;
  int? commits;
  int? additions;
  int? deletions;
  @JsonKey(name: 'changed_files')
  int? changedFiles;

  PullRequest(
      {this.url,
        this.id,
        this.nodeId,
        this.htmlUrl,
        this.diffUrl,
        this.patchUrl,
        this.issueUrl,
        this.number,
        this.state,
        this.locked,
        this.title,
        this.user,
        this.body,
        this.createdAt,
        this.updatedAt,
        this.closedAt,
        this.mergedAt,
        this.mergeCommitSha,
        this.assignee,
        this.assignees,
        this.requestedReviewers,
        this.requestedTeams,
        this.labels,
        this.milestone,
        this.commitsUrl,
        this.reviewCommentsUrl,
        this.reviewCommentUrl,
        this.commentsUrl,
        this.statusesUrl,
        this.head,
        this.base,
        this.authorAssociation,
        this.draft,
        this.merged,
        this.mergeable,
        this.rebaseable,
        this.mergeableState,
        this.mergedBy,
        this.comments,
        this.reviewComments,
        this.maintainerCanModify,
        this.commits,
        this.additions,
        this.deletions,
        this.changedFiles});

  factory PullRequest.fromJson(Map<String, dynamic> json) => _$PullRequestFromJson(json);
  Map<String, dynamic> toJson() => _$PullRequestToJson(this);

}

@JsonSerializable()
class Team {
  int? id;
  @JsonKey(name: 'node_id')
  String? nodeId;
  String? url;
  @JsonKey(name: 'html_url')
  String? htmlUrl;
  String? name;
  String? slug;
  String? description;
  String? privacy;
  String? permission;
  @JsonKey(name: 'members_url')
  String? membersUrl;
  @JsonKey(name: 'repositories_url')
  String? repositoriesUrl;
  Team? parent;

  Team(
      {this.id,
      this.nodeId,
      this.url,
      this.htmlUrl,
      this.name,
      this.slug,
      this.description,
      this.privacy,
      this.permission,
      this.membersUrl,
      this.repositoriesUrl,
      this.parent});

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);
  Map<String, dynamic> toJson() => _$TeamToJson(this);

}

@JsonSerializable()
class Head {
  String? label;
  String? ref;
  String? sha;
  User? user;
  Repository? repo;

  Head({this.label, this.ref, this.sha, this.user, this.repo});

  factory Head.fromJson(Map<String, dynamic> json) => _$HeadFromJson(json);
  Map<String, dynamic> toJson() => _$HeadToJson(this);

}


