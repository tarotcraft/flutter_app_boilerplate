import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_app_boilerplate/common/model/license.dart';
import 'package:flutter_app_boilerplate/common/model/user.dart';

part 'repository.g.dart';

@JsonSerializable()
class Repository {
  int? id;
  @JsonKey(name: 'node_id')
  String? nodeId;
  String? name;
  @JsonKey(name: 'full_name')
  String? fullName;
  User? owner;
  bool? private;
  @JsonKey(name: 'html_url')
  String? htmlUrl;
  String? description;
  bool? fork;
  String? url;
  String? homepage;
  String? language;
  @JsonKey(name: 'forks_count')
  int? forksCount;
  @JsonKey(name: 'stargazers_count')
  int? stargazersCount;
  @JsonKey(name: 'watchers_count')
  int? watchersCount;
  int? size;
  @JsonKey(name: 'default_branch')
  String? defaultBranch;
  @JsonKey(name: 'open_issues_count')
  int? openIssuesCount;
  @JsonKey(name: 'is_template')
  bool? isTemplate;
  List<String>? topics;
  @JsonKey(name: 'has_issues')
  bool? hasIssues;
  @JsonKey(name: 'has_projects')
  bool? hasProjects;
  @JsonKey(name: 'has_wiki')
  bool? hasWiki;
  @JsonKey(name: 'has_pages')
  bool? hasPages;
  @JsonKey(name: 'has_downloads')
  bool? hasDownloads;
  bool? archived;
  bool? disabled;
  @JsonKey(name: 'pushed_at')
  String? pushedAt;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  Permissions? permissions;
  @JsonKey(name: 'allow_rebase_merge')
  bool? allowRebaseMerge;
  @JsonKey(name: 'template_repository')
  Repository? templateRepository;
  @JsonKey(name: 'allow_squash_merge')
  bool? allowSquashMerge;
  @JsonKey(name: 'allow_merge_commit')
  bool? allowMergeCommit;
  @JsonKey(name: 'subscribers_count')
  int? subscribersCount;
  @JsonKey(name: 'network_count')
  int? networkCount;
  License? license;

  Repository({
    this.id,
    this.nodeId,
    this.name,
    this.fullName,
    this.owner,
    this.private,
    this.htmlUrl,
    this.description,
    this.fork,
    this.url,
    this.homepage,
    this.language,
    this.forksCount,
    this.stargazersCount,
    this.watchersCount,
    this.size,
    this.defaultBranch,
    this.openIssuesCount,
    this.isTemplate,
    this.topics,
    this.hasIssues,
    this.hasProjects,
    this.hasWiki,
    this.hasPages,
    this.hasDownloads,
    this.archived,
    this.disabled,
    this.pushedAt,
    this.createdAt,
    this.updatedAt,
    this.permissions,
    this.allowRebaseMerge,
    this.templateRepository,
    this.allowSquashMerge,
    this.allowMergeCommit,
    this.subscribersCount,
    this.networkCount,
    this.license,
  });

  factory Repository.fromJson(Map<String, dynamic> json) =>
      _$RepositoryFromJson(json);

  Map<String, dynamic> toJson() => _$RepositoryToJson(this);
}

@JsonSerializable()
class Permissions {
  bool? admin;
  bool? push;
  bool? pull;

  Permissions({this.admin, this.push, this.pull});

  factory Permissions.fromJson(Map<String, dynamic> json) =>
      _$PermissionsFromJson(json);

  Map<String, dynamic> toJson() => _$PermissionsToJson(this);
}
