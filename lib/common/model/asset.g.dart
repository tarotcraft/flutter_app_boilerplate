// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Asset _$AssetFromJson(Map<String, dynamic> json) {
  return Asset(
    url: json['url'] as String?,
    browserDownloadUrl: json['browser_download_url'] as String?,
    id: json['id'] as int?,
    nodeId: json['node_id'] as String?,
    name: json['name'] as String?,
    label: json['label'] as String?,
    state: json['state'] as String?,
    contentType: json['content_type'] as String?,
    size: json['size'] as int?,
    downloadCount: json['download_count'] as int?,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
    uploader: json['uploader'] == null
        ? null
        : User.fromJson(json['uploader'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AssetToJson(Asset instance) => <String, dynamic>{
      'url': instance.url,
      'browser_download_url': instance.browserDownloadUrl,
      'id': instance.id,
      'node_id': instance.nodeId,
      'name': instance.name,
      'label': instance.label,
      'state': instance.state,
      'content_type': instance.contentType,
      'size': instance.size,
      'download_count': instance.downloadCount,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'uploader': instance.uploader,
    };
