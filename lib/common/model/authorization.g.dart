// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Authorization _$AuthorizationFromJson(Map<String, dynamic> json) {
  return Authorization(
    id: json['id'] as int?,
    url: json['url'] as String?,
    app: json['app'] == null
        ? null
        : App.fromJson(json['app'] as Map<String, dynamic>),
    token: json['token'] as String?,
    hashedToken: json['hashed_token'] as String?,
    tokenLastEight: json['token_last_eight'] as String?,
    note: json['note'] as String?,
    noteUrl: json['note_url'] as String?,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
    scopes:
        (json['scopes'] as List<dynamic>?)?.map((e) => e as String).toList(),
    fingerprint: json['fingerprint'] as String?,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AuthorizationToJson(Authorization instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'app': instance.app,
      'token': instance.token,
      'hashed_token': instance.hashedToken,
      'token_last_eight': instance.tokenLastEight,
      'note': instance.note,
      'note_url': instance.noteUrl,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'scopes': instance.scopes,
      'fingerprint': instance.fingerprint,
      'user': instance.user,
    };

App _$AppFromJson(Map<String, dynamic> json) {
  return App(
    name: json['name'] as String?,
    url: json['url'] as String?,
    clientId: json['client_id'] as String?,
  );
}

Map<String, dynamic> _$AppToJson(App instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
      'client_id': instance.clientId,
    };
