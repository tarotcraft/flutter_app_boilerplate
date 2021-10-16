// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

App _$AppFromJson(Map<String, dynamic> json) {
  return App(
    id: json['id'] as int?,
    nodeId: json['node_id'] as String?,
    owner: json['owner'] == null
        ? null
        : User.fromJson(json['owner'] as Map<String, dynamic>),
    name: json['name'] as String?,
    description: json['description'] as String?,
    externalUrl: json[''] as String?,
    htmlUrl: json['external_url'] as String?,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
    permissions: json['permissions'] == null
        ? null
        : Permissions.fromJson(json['permissions'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AppToJson(App instance) => <String, dynamic>{
      'id': instance.id,
      'node_id': instance.nodeId,
      'owner': instance.owner,
      'name': instance.name,
      'description': instance.description,
      '': instance.externalUrl,
      'external_url': instance.htmlUrl,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'permissions': instance.permissions,
    };
