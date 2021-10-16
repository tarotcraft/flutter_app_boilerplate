import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_app_boilerplate/common/model/user.dart';
part 'authorization.g.dart';

@JsonSerializable()
class Authorization {
  int? id;
  String? url;
  App? app;
  String? token;
  @JsonKey(name: 'hashed_token')
  String? hashedToken;
  @JsonKey(name: 'token_last_eight')
  String? tokenLastEight;
  String? note;
  @JsonKey(name: 'note_url')
  String? noteUrl;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  List<String>? scopes;
  String? fingerprint;
  User? user;

  Authorization({
    this.id,
    this.url,
    this.app,
    this.token,
    this.hashedToken,
    this.tokenLastEight,
    this.note,
    this.noteUrl,
    this.createdAt,
    this.updatedAt,
    this.scopes,
    this.fingerprint,
    this.user,
  });

  factory Authorization.fromJson(Map<String, dynamic> json) => _$AuthorizationFromJson(json);
  Map<String, dynamic> toJson() => _$AuthorizationToJson(this);

}

@JsonSerializable()
class App {
  String? name;
  String? url;
  @JsonKey(name: 'client_id')
  String? clientId;

  App({this.name, this.url, this.clientId});

  factory App.fromJson(Map<String, dynamic> json) => _$AppFromJson(json);
  Map<String, dynamic> toJson() => _$AppToJson(this);
}
