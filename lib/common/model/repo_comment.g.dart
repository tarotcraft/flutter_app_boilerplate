// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo_comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepoComment _$RepoCommentFromJson(Map<String, dynamic> json) {
  return RepoComment(
    htmlUrl: json['html_url'] as String?,
    url: json['url'] as String?,
    id: json['id'] as int?,
    nodeId: json['node_id'] as String?,
    body: json['body'] as String?,
    path: json['path'] as String?,
    position: json['position'] as int?,
    line: json['line'] as int?,
    commitId: json['commit_id'] as String?,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
  );
}

Map<String, dynamic> _$RepoCommentToJson(RepoComment instance) =>
    <String, dynamic>{
      'html_url': instance.htmlUrl,
      'url': instance.url,
      'id': instance.id,
      'node_id': instance.nodeId,
      'body': instance.body,
      'path': instance.path,
      'position': instance.position,
      'line': instance.line,
      'commit_id': instance.commitId,
      'user': instance.user,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
