// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tree.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tree _$TreeFromJson(Map<String, dynamic> json) {
  return Tree(
    path: json['path'] as String?,
    mode: json['mode'] as String?,
    type: json['type'] as String?,
    sha: json['sha'] as String?,
    size: json['size'] as int?,
    url: json['url'] as String?,
  );
}

Map<String, dynamic> _$TreeToJson(Tree instance) => <String, dynamic>{
      'path': instance.path,
      'mode': instance.mode,
      'type': instance.type,
      'sha': instance.sha,
      'size': instance.size,
      'url': instance.url,
    };
