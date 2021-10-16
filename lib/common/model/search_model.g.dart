// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchModel<T> _$SearchModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) {
  return SearchModel<T>(
    totalCount: json['total_count'] as int?,
    incompleteResults: json['incomplete_results'] as bool?,
    items: (json['items'] as List<dynamic>?)?.map(fromJsonT).toList(),
  );
}

Map<String, dynamic> _$SearchModelToJson<T>(
  SearchModel<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'total_count': instance.totalCount,
      'incomplete_results': instance.incompleteResults,
      'items': instance.items?.map(toJsonT).toList(),
    };
