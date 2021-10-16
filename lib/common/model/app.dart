import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_app_boilerplate/common/model/user.dart';
import 'package:flutter_app_boilerplate/common/model/permissions.dart';

part 'app.g.dart';

@JsonSerializable()
class App {
  int? id;
  @JsonKey(name: 'node_id')
  String? nodeId;
  User? owner;
  String? name;
  String? description;
  @JsonKey(name: '')
  String? externalUrl;
  @JsonKey(name: 'external_url')
  String? htmlUrl;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  Permissions? permissions;

  App({
    this.id,
    this.nodeId,
    this.owner,
    this.name,
    this.description,
    this.externalUrl,
    this.htmlUrl,
    this.createdAt,
    this.updatedAt,
    this.permissions,
  });

  factory App.fromJson(Map<String, dynamic> json) => _$AppFromJson(json);

  Map<String, dynamic> toJson() => _$AppToJson(this);
}
