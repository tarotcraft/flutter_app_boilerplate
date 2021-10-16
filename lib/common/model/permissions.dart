import 'package:json_annotation/json_annotation.dart';
part 'permissions.g.dart';

@JsonSerializable()
class Permissions {
  String? administration;
  String? checks;
  String? contents;
  String? deployments;
  String? issues;
  String? members;
  String? metadata;
  @JsonKey(name: 'organization_administration')
  String? organizationAdministration;
  @JsonKey(name: 'organization_hooks')
  String? organizationHooks;
  @JsonKey(name: 'organization_plan')
  String? organizationPlan;
  @JsonKey(name: 'organization_projects')
  String? organizationProjects;
  @JsonKey(name: 'organization_user_blocking')
  String? organizationUserBlocking;
  String? pages;
  @JsonKey(name: 'pull_requests')
  String? pullRequests;
  @JsonKey(name: 'repository_hooks')
  String? repositoryHooks;
  @JsonKey(name: 'repository_projects')
  String? repositoryProjects;
  String? statuses;
  @JsonKey(name: 'team_discussions')
  String? teamDiscussions;
  @JsonKey(name: 'vulnerability_alerts')
  String? vulnerabilityAlerts;

  Permissions(
      {this.administration,
        this.checks,
        this.contents,
        this.deployments,
        this.issues,
        this.members,
        this.metadata,
        this.organizationAdministration,
        this.organizationHooks,
        this.organizationPlan,
        this.organizationProjects,
        this.organizationUserBlocking,
        this.pages,
        this.pullRequests,
        this.repositoryHooks,
        this.repositoryProjects,
        this.statuses,
        this.teamDiscussions,
        this.vulnerabilityAlerts});

  factory Permissions.fromJson(Map<String, dynamic> json) => _$PermissionsFromJson(json);
  Map<String, dynamic> toJson() => _$PermissionsToJson(this);
}