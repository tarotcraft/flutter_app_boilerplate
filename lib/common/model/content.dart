import 'package:json_annotation/json_annotation.dart';
part 'content.g.dart';

@JsonSerializable()
class Content {
  String? name;
  String? path;
  String? sha;
  int? size;
  String? url;
  @JsonKey(name: 'html_url')
  String? htmlUrl;
  @JsonKey(name: 'git_url')
  String? gitUrl;
  @JsonKey(name: 'download_url')
  String? downloadUrl;
  String? type;

  Content(
      {this.name,
        this.path,
        this.sha,
        this.size,
        this.url,
        this.htmlUrl,
        this.gitUrl,
        this.downloadUrl,
        this.type});

  factory Content.fromJson(Map<String, dynamic> json) => _$ContentFromJson(json);
  Map<String, dynamic> toJson() => _$ContentToJson(this);

}
