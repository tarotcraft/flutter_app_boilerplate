// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewComment _$ReviewCommentFromJson(Map<String, dynamic> json) {
  return ReviewComment(
    url: json['url'] as String?,
    id: json['id'] as int?,
    nodeId: json['node_id'] as String?,
    pullRequestReviewId: json['pull_request_review_id'] as int?,
    diffHunk: json['diff_hunk'] as String?,
    path: json['path'] as String?,
    position: json['position'] as int?,
    originalPosition: json['original_position'] as int?,
    commitId: json['commit_id'] as String?,
    originalCommitId: json['original_commit_id'] as String?,
    inReplyToId: json['in_reply_to_id'] as int?,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    body: json['body'] as String?,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
    htmlUrl: json['html_url'] as String?,
    pullRequestUrl: json['pull_request_url'] as String?,
    authorAssociation: json['author_association'] as String?,
  );
}

Map<String, dynamic> _$ReviewCommentToJson(ReviewComment instance) =>
    <String, dynamic>{
      'url': instance.url,
      'id': instance.id,
      'node_id': instance.nodeId,
      'pull_request_review_id': instance.pullRequestReviewId,
      'diff_hunk': instance.diffHunk,
      'path': instance.path,
      'position': instance.position,
      'original_position': instance.originalPosition,
      'commit_id': instance.commitId,
      'original_commit_id': instance.originalCommitId,
      'in_reply_to_id': instance.inReplyToId,
      'user': instance.user,
      'body': instance.body,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'html_url': instance.htmlUrl,
      'pull_request_url': instance.pullRequestUrl,
      'author_association': instance.authorAssociation,
    };

Self _$SelfFromJson(Map<String, dynamic> json) {
  return Self(
    href: json['href'] as String?,
  );
}

Map<String, dynamic> _$SelfToJson(Self instance) => <String, dynamic>{
      'href': instance.href,
    };

Html _$HtmlFromJson(Map<String, dynamic> json) {
  return Html(
    href: json['href'] as String?,
  );
}

Map<String, dynamic> _$HtmlToJson(Html instance) => <String, dynamic>{
      'href': instance.href,
    };
