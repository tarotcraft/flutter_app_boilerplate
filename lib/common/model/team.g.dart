// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Team _$TeamFromJson(Map<String, dynamic> json) {
  return Team(
    name: json['name'] as String?,
    id: json['id'] as int?,
    nodeId: json['node_id'] as String?,
    slug: json['slug'] as String?,
    description: json['description'] as String?,
    privacy: json['privacy'] as String?,
    url: json['url'] as String?,
    htmlUrl: json['html_url'] as String?,
    membersUrl: json['members_url'] as String?,
    repositoriesUrl: json['repositories_url'] as String?,
    permission: json['permission'] as String?,
  );
}

Map<String, dynamic> _$TeamToJson(Team instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'node_id': instance.nodeId,
      'slug': instance.slug,
      'description': instance.description,
      'privacy': instance.privacy,
      'url': instance.url,
      'html_url': instance.htmlUrl,
      'members_url': instance.membersUrl,
      'repositories_url': instance.repositoriesUrl,
      'permission': instance.permission,
    };
