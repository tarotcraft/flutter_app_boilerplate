// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetail _$UserDetailFromJson(Map<String, dynamic> json) {
  return UserDetail(
    login: json['login'] as String?,
    id: json['id'] as int?,
    nodeId: json['node_id'] as String?,
    avatarUrl: json['avatar_url'] as String?,
    gravatarId: json['gravatar_id'] as String?,
    url: json['url'] as String?,
    type: json['type'] as String?,
    siteAdmin: json['site_admin'] as bool?,
    name: json['name'] as String?,
    company: json['company'] as String?,
    blog: json['blog'] as String?,
    location: json['location'] as String?,
    email: json['email'] as String?,
    hireable: json['hireable'] as bool?,
    bio: json['bio'] as String?,
    publicRepos: json['public_repos'] as int?,
    publicGists: json['public_gists'] as int?,
    followers: json['followers'] as int?,
    following: json['following'] as int?,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
  );
}

Map<String, dynamic> _$UserDetailToJson(UserDetail instance) =>
    <String, dynamic>{
      'login': instance.login,
      'id': instance.id,
      'node_id': instance.nodeId,
      'avatar_url': instance.avatarUrl,
      'gravatar_id': instance.gravatarId,
      'url': instance.url,
      'type': instance.type,
      'site_admin': instance.siteAdmin,
      'name': instance.name,
      'company': instance.company,
      'blog': instance.blog,
      'location': instance.location,
      'email': instance.email,
      'hireable': instance.hireable,
      'bio': instance.bio,
      'public_repos': instance.publicRepos,
      'public_gists': instance.publicGists,
      'followers': instance.followers,
      'following': instance.following,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
