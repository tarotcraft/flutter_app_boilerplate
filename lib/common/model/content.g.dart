// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Content _$ContentFromJson(Map<String, dynamic> json) {
  return Content(
    name: json['name'] as String?,
    path: json['path'] as String?,
    sha: json['sha'] as String?,
    size: json['size'] as int?,
    url: json['url'] as String?,
    htmlUrl: json['html_url'] as String?,
    gitUrl: json['git_url'] as String?,
    downloadUrl: json['download_url'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'name': instance.name,
      'path': instance.path,
      'sha': instance.sha,
      'size': instance.size,
      'url': instance.url,
      'html_url': instance.htmlUrl,
      'git_url': instance.gitUrl,
      'download_url': instance.downloadUrl,
      'type': instance.type,
    };
