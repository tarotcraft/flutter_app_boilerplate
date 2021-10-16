// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commits.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Commits _$CommitsFromJson(Map<String, dynamic> json) {
  return Commits(
    url: json['url'] as String?,
    sha: json['sha'] as String?,
    nodeId: json['node_id'] as String?,
    htmlUrl: json['html_url'] as String?,
    commentsUrl: json['comments_url'] as String?,
    commit: json['commit'] == null
        ? null
        : Commit.fromJson(json['commit'] as Map<String, dynamic>),
    author: json['author'] == null
        ? null
        : User.fromJson(json['author'] as Map<String, dynamic>),
    committer: json['committer'] == null
        ? null
        : User.fromJson(json['committer'] as Map<String, dynamic>),
    parents: (json['parents'] as List<dynamic>?)
        ?.map((e) => Parents.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CommitsToJson(Commits instance) => <String, dynamic>{
      'url': instance.url,
      'sha': instance.sha,
      'node_id': instance.nodeId,
      'html_url': instance.htmlUrl,
      'comments_url': instance.commentsUrl,
      'commit': instance.commit,
      'author': instance.author,
      'committer': instance.committer,
      'parents': instance.parents,
    };

Commit _$CommitFromJson(Map<String, dynamic> json) {
  return Commit(
    url: json['url'] as String?,
    author: json['author'] == null
        ? null
        : Author.fromJson(json['author'] as Map<String, dynamic>),
    committer: json['committer'] == null
        ? null
        : Author.fromJson(json['committer'] as Map<String, dynamic>),
    message: json['message'] as String?,
    tree: json['tree'] == null
        ? null
        : Tree.fromJson(json['tree'] as Map<String, dynamic>),
    commentCount: json['comment_count'] as int?,
    verification: json['verification'] == null
        ? null
        : Verification.fromJson(json['verification'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CommitToJson(Commit instance) => <String, dynamic>{
      'url': instance.url,
      'author': instance.author,
      'committer': instance.committer,
      'message': instance.message,
      'tree': instance.tree,
      'comment_count': instance.commentCount,
      'verification': instance.verification,
    };

Author _$AuthorFromJson(Map<String, dynamic> json) {
  return Author(
    name: json['name'] as String?,
    email: json['email'] as String?,
    date: json['date'] as String?,
  );
}

Map<String, dynamic> _$AuthorToJson(Author instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'date': instance.date,
    };

Verification _$VerificationFromJson(Map<String, dynamic> json) {
  return Verification(
    verified: json['verified'] as bool?,
    reason: json['reason'] as String?,
    signature: json['signature'] as String?,
    payload: json['payload'] as String?,
  );
}

Map<String, dynamic> _$VerificationToJson(Verification instance) =>
    <String, dynamic>{
      'verified': instance.verified,
      'reason': instance.reason,
      'signature': instance.signature,
      'payload': instance.payload,
    };

Parents _$ParentsFromJson(Map<String, dynamic> json) {
  return Parents(
    url: json['url'] as String?,
    sha: json['sha'] as String?,
  );
}

Map<String, dynamic> _$ParentsToJson(Parents instance) => <String, dynamic>{
      'url': instance.url,
      'sha': instance.sha,
    };
