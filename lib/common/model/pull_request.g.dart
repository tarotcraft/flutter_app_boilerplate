// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pull_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PullRequest _$PullRequestFromJson(Map<String, dynamic> json) {
  return PullRequest(
    url: json['url'] as String?,
    id: json['id'] as int?,
    nodeId: json['node_id'] as String?,
    htmlUrl: json['html_url'] as String?,
    diffUrl: json['diff_url'] as String?,
    patchUrl: json['patch_url'] as String?,
    issueUrl: json['issue_url'] as String?,
    number: json['number'] as int?,
    state: json['state'] as String?,
    locked: json['locked'] as bool?,
    title: json['title'] as String?,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    body: json['body'] as String?,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
    closedAt: json['closed_at'] as String?,
    mergedAt: json['merged_at'] as String?,
    mergeCommitSha: json['merge_commit_sha'] as String?,
    assignee: json['assignee'] == null
        ? null
        : User.fromJson(json['assignee'] as Map<String, dynamic>),
    assignees: (json['assignees'] as List<dynamic>?)
        ?.map((e) => User.fromJson(e as Map<String, dynamic>))
        .toList(),
    requestedReviewers: (json['requested_reviewers'] as List<dynamic>?)
        ?.map((e) => User.fromJson(e as Map<String, dynamic>))
        .toList(),
    requestedTeams: (json['requested_teams'] as List<dynamic>?)
        ?.map((e) => Team.fromJson(e as Map<String, dynamic>))
        .toList(),
    labels: (json['labels'] as List<dynamic>?)
        ?.map((e) => Label.fromJson(e as Map<String, dynamic>))
        .toList(),
    milestone: json['milestone'] == null
        ? null
        : Milestone.fromJson(json['milestone'] as Map<String, dynamic>),
    commitsUrl: json['commits_url'] as String?,
    reviewCommentsUrl: json['review_comments_url'] as String?,
    reviewCommentUrl: json['review_comment_url'] as String?,
    commentsUrl: json['comments_url'] as String?,
    statusesUrl: json['statuses_url'] as String?,
    head: json['head'] == null
        ? null
        : Head.fromJson(json['head'] as Map<String, dynamic>),
    base: json['base'] == null
        ? null
        : Head.fromJson(json['base'] as Map<String, dynamic>),
    authorAssociation: json['author_association'] as String?,
    draft: json['draft'] as bool?,
    merged: json['merged'] as bool?,
    mergeable: json['mergeable'] as bool?,
    rebaseable: json['rebaseable'] as bool?,
    mergeableState: json['mergeable_state'] as String?,
    mergedBy: json['merged_by'] == null
        ? null
        : User.fromJson(json['merged_by'] as Map<String, dynamic>),
    comments: json['comments'] as int?,
    reviewComments: json['review_comments'] as int?,
    maintainerCanModify: json['maintainer_can_modify'] as bool?,
    commits: json['commits'] as int?,
    additions: json['additions'] as int?,
    deletions: json['deletions'] as int?,
    changedFiles: json['changed_files'] as int?,
  );
}

Map<String, dynamic> _$PullRequestToJson(PullRequest instance) =>
    <String, dynamic>{
      'url': instance.url,
      'id': instance.id,
      'node_id': instance.nodeId,
      'html_url': instance.htmlUrl,
      'diff_url': instance.diffUrl,
      'patch_url': instance.patchUrl,
      'issue_url': instance.issueUrl,
      'number': instance.number,
      'state': instance.state,
      'locked': instance.locked,
      'title': instance.title,
      'user': instance.user,
      'body': instance.body,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'closed_at': instance.closedAt,
      'merged_at': instance.mergedAt,
      'merge_commit_sha': instance.mergeCommitSha,
      'assignee': instance.assignee,
      'assignees': instance.assignees,
      'requested_reviewers': instance.requestedReviewers,
      'requested_teams': instance.requestedTeams,
      'labels': instance.labels,
      'milestone': instance.milestone,
      'commits_url': instance.commitsUrl,
      'review_comments_url': instance.reviewCommentsUrl,
      'review_comment_url': instance.reviewCommentUrl,
      'comments_url': instance.commentsUrl,
      'statuses_url': instance.statusesUrl,
      'head': instance.head,
      'base': instance.base,
      'author_association': instance.authorAssociation,
      'draft': instance.draft,
      'merged': instance.merged,
      'mergeable': instance.mergeable,
      'rebaseable': instance.rebaseable,
      'mergeable_state': instance.mergeableState,
      'merged_by': instance.mergedBy,
      'comments': instance.comments,
      'review_comments': instance.reviewComments,
      'maintainer_can_modify': instance.maintainerCanModify,
      'commits': instance.commits,
      'additions': instance.additions,
      'deletions': instance.deletions,
      'changed_files': instance.changedFiles,
    };

Team _$TeamFromJson(Map<String, dynamic> json) {
  return Team(
    id: json['id'] as int?,
    nodeId: json['node_id'] as String?,
    url: json['url'] as String?,
    htmlUrl: json['html_url'] as String?,
    name: json['name'] as String?,
    slug: json['slug'] as String?,
    description: json['description'] as String?,
    privacy: json['privacy'] as String?,
    permission: json['permission'] as String?,
    membersUrl: json['members_url'] as String?,
    repositoriesUrl: json['repositories_url'] as String?,
    parent: json['parent'] == null
        ? null
        : Team.fromJson(json['parent'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TeamToJson(Team instance) => <String, dynamic>{
      'id': instance.id,
      'node_id': instance.nodeId,
      'url': instance.url,
      'html_url': instance.htmlUrl,
      'name': instance.name,
      'slug': instance.slug,
      'description': instance.description,
      'privacy': instance.privacy,
      'permission': instance.permission,
      'members_url': instance.membersUrl,
      'repositories_url': instance.repositoriesUrl,
      'parent': instance.parent,
    };

Head _$HeadFromJson(Map<String, dynamic> json) {
  return Head(
    label: json['label'] as String?,
    ref: json['ref'] as String?,
    sha: json['sha'] as String?,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    repo: json['repo'] == null
        ? null
        : Repository.fromJson(json['repo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HeadToJson(Head instance) => <String, dynamic>{
      'label': instance.label,
      'ref': instance.ref,
      'sha': instance.sha,
      'user': instance.user,
      'repo': instance.repo,
    };
