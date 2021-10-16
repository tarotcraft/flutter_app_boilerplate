// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_pulls_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepositoryPullsModel _$RepositoryPullsModelFromJson(Map<String, dynamic> json) {
  return RepositoryPullsModel(
    totalCount: json['total_count'] as int?,
    incompleteResults: json['incomplete_results'] as bool?,
    items: (json['items'] as List<dynamic>?)
        ?.map((e) => Issue.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$RepositoryPullsModelToJson(
        RepositoryPullsModel instance) =>
    <String, dynamic>{
      'total_count': instance.totalCount,
      'incomplete_results': instance.incompleteResults,
      'items': instance.items,
    };
