// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) {
  return NewsModel(
    id: json['id'] as String?,
    type: json['type'] as String?,
    actor: json['actor'] == null
        ? null
        : Actor.fromJson(json['actor'] as Map<String, dynamic>),
    repo: json['repo'] == null
        ? null
        : Repository.fromJson(json['repo'] as Map<String, dynamic>),
    payload: json['payload'],
    public: json['public'] as bool?,
    createdAt: json['created_at'] as String?,
    org: json['org'] == null
        ? null
        : Org.fromJson(json['org'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NewsModelToJson(NewsModel instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'actor': instance.actor,
      'repo': instance.repo,
      'payload': instance.payload,
      'public': instance.public,
      'created_at': instance.createdAt,
      'org': instance.org,
    };

Actor _$ActorFromJson(Map<String, dynamic> json) {
  return Actor(
    id: json['id'] as int?,
    login: json['login'] as String?,
    displayLogin: json['display_login'] as String?,
    gravatarId: json['gravatar_id'] as String?,
    url: json['url'] as String?,
    avatarUrl: json['avatar_url'] as String?,
  );
}

Map<String, dynamic> _$ActorToJson(Actor instance) => <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'display_login': instance.displayLogin,
      'gravatar_id': instance.gravatarId,
      'url': instance.url,
      'avatar_url': instance.avatarUrl,
    };

Org _$OrgFromJson(Map<String, dynamic> json) {
  return Org(
    id: json['id'] as int?,
    login: json['login'] as String?,
    gravatarId: json['gravatar_id'] as String?,
    url: json['url'] as String?,
    avatarUrl: json['avatar_url'] as String?,
  );
}

Map<String, dynamic> _$OrgToJson(Org instance) => <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'gravatar_id': instance.gravatarId,
      'url': instance.url,
      'avatar_url': instance.avatarUrl,
    };
