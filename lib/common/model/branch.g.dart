// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Branch _$BranchFromJson(Map<String, dynamic> json) {
  return Branch(
    name: json['name'] as String?,
    commit: json['commit'] == null
        ? null
        : Commit.fromJson(json['commit'] as Map<String, dynamic>),
    protected: json['protected'] as bool?,
    protection: json['protection'] == null
        ? null
        : Protection.fromJson(json['protection'] as Map<String, dynamic>),
    protectionUrl: json['protection_url'] as String?,
  );
}

Map<String, dynamic> _$BranchToJson(Branch instance) => <String, dynamic>{
      'name': instance.name,
      'commit': instance.commit,
      'protected': instance.protected,
      'protection': instance.protection,
      'protection_url': instance.protectionUrl,
    };

Commit _$CommitFromJson(Map<String, dynamic> json) {
  return Commit(
    sha: json['sha'] as String?,
    url: json['url'] as String?,
  );
}

Map<String, dynamic> _$CommitToJson(Commit instance) => <String, dynamic>{
      'sha': instance.sha,
      'url': instance.url,
    };

Protection _$ProtectionFromJson(Map<String, dynamic> json) {
  return Protection(
    enabled: json['enabled'] as bool?,
    requiredStatusChecks: json['required_status_checks'] == null
        ? null
        : RequiredStatusChecks.fromJson(
            json['required_status_checks'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ProtectionToJson(Protection instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'required_status_checks': instance.requiredStatusChecks,
    };

RequiredStatusChecks _$RequiredStatusChecksFromJson(Map<String, dynamic> json) {
  return RequiredStatusChecks(
    enforcementLevel: json['enforcement_level'] as String?,
    contexts:
        (json['contexts'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$RequiredStatusChecksToJson(
        RequiredStatusChecks instance) =>
    <String, dynamic>{
      'enforcement_level': instance.enforcementLevel,
      'contexts': instance.contexts,
    };
