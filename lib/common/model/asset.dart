import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_app_boilerplate/common/model/user.dart';
part 'asset.g.dart';

@JsonSerializable()
class Asset {
  String? url;
  @JsonKey(name: 'browser_download_url')
  String? browserDownloadUrl;
  int? id;
  @JsonKey(name: 'node_id')
  String? nodeId;
  String? name;
  String? label;
  String? state;
  @JsonKey(name: 'content_type')
  String? contentType;
  int? size;
  @JsonKey(name: 'download_count')
  int? downloadCount;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  User? uploader;

  Asset(
      {this.url,
        this.browserDownloadUrl,
        this.id,
        this.nodeId,
        this.name,
        this.label,
        this.state,
        this.contentType,
        this.size,
        this.downloadCount,
        this.createdAt,
        this.updatedAt,
        this.uploader});

  factory Asset.fromJson(Map<String, dynamic> json) => _$AssetFromJson(json);
  Map<String, dynamic> toJson() => _$AssetToJson(this);

}
