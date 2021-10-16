import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_app_boilerplate/common/model/asset.dart';
import 'package:flutter_app_boilerplate/common/model/user.dart';
part 'release.g.dart';

@JsonSerializable()
class Release {
  String? url;
  @JsonKey(name: 'assets_url')
  String? assetsUrl;
  @JsonKey(name: 'upload_url')
  String? uploadUrl;
  @JsonKey(name: 'html_url')
  String? htmlUrl;
  int? id;
  @JsonKey(name: 'node_id')
  String? nodeId;
  @JsonKey(name: 'tag_name')
  String? tagName;
  @JsonKey(name: 'target_commitish')
  String? targetCommitish;
  String? name;
  bool? draft;
  User? author;
  bool? prerelease;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'published_at')
  String? publishedAt;
  List<Asset>? assets;
  @JsonKey(name: 'tarball_url')
  String? tarballUrl;
  @JsonKey(name: 'zipball_url')
  String? zipballUrl;
  String? body;

  Release(
      {this.url,
        this.assetsUrl,
        this.uploadUrl,
        this.htmlUrl,
        this.id,
        this.nodeId,
        this.tagName,
        this.targetCommitish,
        this.name,
        this.draft,
        this.author,
        this.prerelease,
        this.createdAt,
        this.publishedAt,
        this.assets,
        this.tarballUrl,
        this.zipballUrl,
        this.body});

  factory Release.fromJson(Map<String, dynamic> json) => _$ReleaseFromJson(json);
  Map<String, dynamic> toJson() => _$ReleaseToJson(this);

}
