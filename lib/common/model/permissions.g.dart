// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permissions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Permissions _$PermissionsFromJson(Map<String, dynamic> json) {
  return Permissions(
    administration: json['administration'] as String?,
    checks: json['checks'] as String?,
    contents: json['contents'] as String?,
    deployments: json['deployments'] as String?,
    issues: json['issues'] as String?,
    members: json['members'] as String?,
    metadata: json['metadata'] as String?,
    organizationAdministration: json['organization_administration'] as String?,
    organizationHooks: json['organization_hooks'] as String?,
    organizationPlan: json['organization_plan'] as String?,
    organizationProjects: json['organization_projects'] as String?,
    organizationUserBlocking: json['organization_user_blocking'] as String?,
    pages: json['pages'] as String?,
    pullRequests: json['pull_requests'] as String?,
    repositoryHooks: json['repository_hooks'] as String?,
    repositoryProjects: json['repository_projects'] as String?,
    statuses: json['statuses'] as String?,
    teamDiscussions: json['team_discussions'] as String?,
    vulnerabilityAlerts: json['vulnerability_alerts'] as String?,
  );
}

Map<String, dynamic> _$PermissionsToJson(Permissions instance) =>
    <String, dynamic>{
      'administration': instance.administration,
      'checks': instance.checks,
      'contents': instance.contents,
      'deployments': instance.deployments,
      'issues': instance.issues,
      'members': instance.members,
      'metadata': instance.metadata,
      'organization_administration': instance.organizationAdministration,
      'organization_hooks': instance.organizationHooks,
      'organization_plan': instance.organizationPlan,
      'organization_projects': instance.organizationProjects,
      'organization_user_blocking': instance.organizationUserBlocking,
      'pages': instance.pages,
      'pull_requests': instance.pullRequests,
      'repository_hooks': instance.repositoryHooks,
      'repository_projects': instance.repositoryProjects,
      'statuses': instance.statuses,
      'team_discussions': instance.teamDiscussions,
      'vulnerability_alerts': instance.vulnerabilityAlerts,
    };
