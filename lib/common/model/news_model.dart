import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_app_boilerplate/common/model/repository.dart';
part 'news_model.g.dart';

@JsonSerializable()
class NewsModel {
  String? id;
  String? type;
  Actor? actor;
  Repository? repo;
  dynamic payload;
  bool? public;
  @JsonKey(name: 'created_at')
  String? createdAt;
  Org? org;

  NewsModel(
      {this.id,
      this.type,
      this.actor,
      this.repo,
      this.payload,
      this.public,
      this.createdAt,
      this.org});

  factory NewsModel.fromJson(Map<String, dynamic> json) => _$NewsModelFromJson(json);
  Map<String, dynamic> toJson() => _$NewsModelToJson(this);

}

@JsonSerializable()
class Actor {
  int? id;
  String? login;
  @JsonKey(name: 'display_login')
  String? displayLogin;
  @JsonKey(name: 'gravatar_id')
  String? gravatarId;
  String? url;
  @JsonKey(name: 'avatar_url')
  String? avatarUrl;

  Actor(
      {this.id,
      this.login,
      this.displayLogin,
      this.gravatarId,
      this.url,
      this.avatarUrl});

  factory Actor.fromJson(Map<String, dynamic> json) => _$ActorFromJson(json);
  Map<String, dynamic> toJson() => _$ActorToJson(this);

}

@JsonSerializable()
class Org {
  int? id;
  String? login;
  @JsonKey(name: 'gravatar_id')
  String? gravatarId;
  String? url;
  @JsonKey(name: 'avatar_url')
  String? avatarUrl;

  Org({this.id, this.login, this.gravatarId, this.url, this.avatarUrl});

  factory Org.fromJson(Map<String, dynamic> json) => _$OrgFromJson(json);
  Map<String, dynamic> toJson() => _$OrgToJson(this);

}
