// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Repository _$RepositoryFromJson(Map<String, dynamic> json) {
  return Repository(
    id: json['id'] as int?,
    nodeId: json['node_id'] as String?,
    name: json['name'] as String?,
    fullName: json['full_name'] as String?,
    owner: json['owner'] == null
        ? null
        : User.fromJson(json['owner'] as Map<String, dynamic>),
    private: json['private'] as bool?,
    htmlUrl: json['html_url'] as String?,
    description: json['description'] as String?,
    fork: json['fork'] as bool?,
    url: json['url'] as String?,
    homepage: json['homepage'] as String?,
    language: json['language'] as String?,
    forksCount: json['forks_count'] as int?,
    stargazersCount: json['stargazers_count'] as int?,
    watchersCount: json['watchers_count'] as int?,
    size: json['size'] as int?,
    defaultBranch: json['default_branch'] as String?,
    openIssuesCount: json['open_issues_count'] as int?,
    isTemplate: json['is_template'] as bool?,
    topics:
        (json['topics'] as List<dynamic>?)?.map((e) => e as String).toList(),
    hasIssues: json['has_issues'] as bool?,
    hasProjects: json['has_projects'] as bool?,
    hasWiki: json['has_wiki'] as bool?,
    hasPages: json['has_pages'] as bool?,
    hasDownloads: json['has_downloads'] as bool?,
    archived: json['archived'] as bool?,
    disabled: json['disabled'] as bool?,
    pushedAt: json['pushed_at'] as String?,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
    permissions: json['permissions'] == null
        ? null
        : Permissions.fromJson(json['permissions'] as Map<String, dynamic>),
    allowRebaseMerge: json['allow_rebase_merge'] as bool?,
    templateRepository: json['template_repository'] == null
        ? null
        : Repository.fromJson(
            json['template_repository'] as Map<String, dynamic>),
    allowSquashMerge: json['allow_squash_merge'] as bool?,
    allowMergeCommit: json['allow_merge_commit'] as bool?,
    subscribersCount: json['subscribers_count'] as int?,
    networkCount: json['network_count'] as int?,
    license: json['license'] == null
        ? null
        : License.fromJson(json['license'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RepositoryToJson(Repository instance) =>
    <String, dynamic>{
      'id': instance.id,
      'node_id': instance.nodeId,
      'name': instance.name,
      'full_name': instance.fullName,
      'owner': instance.owner,
      'private': instance.private,
      'html_url': instance.htmlUrl,
      'description': instance.description,
      'fork': instance.fork,
      'url': instance.url,
      'homepage': instance.homepage,
      'language': instance.language,
      'forks_count': instance.forksCount,
      'stargazers_count': instance.stargazersCount,
      'watchers_count': instance.watchersCount,
      'size': instance.size,
      'default_branch': instance.defaultBranch,
      'open_issues_count': instance.openIssuesCount,
      'is_template': instance.isTemplate,
      'topics': instance.topics,
      'has_issues': instance.hasIssues,
      'has_projects': instance.hasProjects,
      'has_wiki': instance.hasWiki,
      'has_pages': instance.hasPages,
      'has_downloads': instance.hasDownloads,
      'archived': instance.archived,
      'disabled': instance.disabled,
      'pushed_at': instance.pushedAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'permissions': instance.permissions,
      'allow_rebase_merge': instance.allowRebaseMerge,
      'template_repository': instance.templateRepository,
      'allow_squash_merge': instance.allowSquashMerge,
      'allow_merge_commit': instance.allowMergeCommit,
      'subscribers_count': instance.subscribersCount,
      'network_count': instance.networkCount,
      'license': instance.license,
    };

Permissions _$PermissionsFromJson(Map<String, dynamic> json) {
  return Permissions(
    admin: json['admin'] as bool?,
    push: json['push'] as bool?,
    pull: json['pull'] as bool?,
  );
}

Map<String, dynamic> _$PermissionsToJson(Permissions instance) =>
    <String, dynamic>{
      'admin': instance.admin,
      'push': instance.push,
      'pull': instance.pull,
    };
