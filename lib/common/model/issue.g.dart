// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Issue _$IssueFromJson(Map<String, dynamic> json) {
  return Issue(
    url: json['url'] as String?,
    repositoryUrl: json['repository_url'] as String?,
    labelsUrl: json['labels_url'] as String?,
    commentsUrl: json['comments_url'] as String?,
    eventsUrl: json['events_url'] as String?,
    htmlUrl: json['html_url'] as String?,
    id: json['id'] as int?,
    nodeId: json['node_id'] as String?,
    number: json['number'] as int?,
    title: json['title'] as String?,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    labels: (json['labels'] as List<dynamic>?)
        ?.map((e) => Label.fromJson(e as Map<String, dynamic>))
        .toList(),
    state: json['state'] as String?,
    locked: json['locked'] as bool?,
    assignee: json['assignee'] == null
        ? null
        : User.fromJson(json['assignee'] as Map<String, dynamic>),
    assignees: (json['assignees'] as List<dynamic>?)
        ?.map((e) => User.fromJson(e as Map<String, dynamic>))
        .toList(),
    milestone: json['milestone'] == null
        ? null
        : Milestone.fromJson(json['milestone'] as Map<String, dynamic>),
    comments: json['comments'] as int?,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
    closedAt: json['closed_at'] as String?,
    authorAssociation: json['author_association'] as String?,
    body: json['body'] as String?,
  );
}

Map<String, dynamic> _$IssueToJson(Issue instance) => <String, dynamic>{
      'url': instance.url,
      'repository_url': instance.repositoryUrl,
      'labels_url': instance.labelsUrl,
      'comments_url': instance.commentsUrl,
      'events_url': instance.eventsUrl,
      'html_url': instance.htmlUrl,
      'id': instance.id,
      'node_id': instance.nodeId,
      'number': instance.number,
      'title': instance.title,
      'user': instance.user,
      'labels': instance.labels,
      'state': instance.state,
      'locked': instance.locked,
      'assignee': instance.assignee,
      'assignees': instance.assignees,
      'milestone': instance.milestone,
      'comments': instance.comments,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'closed_at': instance.closedAt,
      'author_association': instance.authorAssociation,
      'body': instance.body,
    };
