// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pinned.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pinned _$PinnedFromJson(Map<String, dynamic> json) {
  return Pinned(
    owner: json['owner'] as String?,
    avatar: json['avatar'] as String?,
    name: json['name'] as String?,
    description: json['description'] as String?,
    language: json['language'] as String?,
    color: json['color'] as String?,
    stars: json['stars'] as int?,
    forks: json['forks'] as int?,
  );
}

Map<String, dynamic> _$PinnedToJson(Pinned instance) => <String, dynamic>{
      'owner': instance.owner,
      'avatar': instance.avatar,
      'name': instance.name,
      'description': instance.description,
      'language': instance.language,
      'color': instance.color,
      'stars': instance.stars,
      'forks': instance.forks,
    };
