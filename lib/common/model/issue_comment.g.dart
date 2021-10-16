// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issue_comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IssueComment _$IssueCommentFromJson(Map<String, dynamic> json) {
  return IssueComment(
    id: json['id'] as int?,
    nodeId: json['node_id'] as String?,
    url: json['url'] as String?,
    htmlUrl: json['html_url'] as String?,
    body: json['body'] as String?,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
  );
}

Map<String, dynamic> _$IssueCommentToJson(IssueComment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'node_id': instance.nodeId,
      'url': instance.url,
      'html_url': instance.htmlUrl,
      'body': instance.body,
      'user': instance.user,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
