// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contributor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contributor _$ContributorFromJson(Map<String, dynamic> json) {
  return Contributor(
    login: json['login'] as String?,
    id: json['id'] as int?,
    nodeId: json['node_id'] as String?,
    avatarUrl: json['avatar_url'] as String?,
    gravatarId: json['gravatar_id'] as String?,
    url: json['url'] as String?,
    htmlUrl: json['html_url'] as String?,
    type: json['type'] as String?,
    siteAdmin: json['site_admin'] as bool?,
    contributions: json['contributions'] as int?,
  );
}

Map<String, dynamic> _$ContributorToJson(Contributor instance) =>
    <String, dynamic>{
      'login': instance.login,
      'id': instance.id,
      'node_id': instance.nodeId,
      'avatar_url': instance.avatarUrl,
      'gravatar_id': instance.gravatarId,
      'url': instance.url,
      'html_url': instance.htmlUrl,
      'type': instance.type,
      'site_admin': instance.siteAdmin,
      'contributions': instance.contributions,
    };
