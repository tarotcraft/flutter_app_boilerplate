import 'package:json_annotation/json_annotation.dart';

part 'readme.g.dart';

@JsonSerializable()
class Readme {
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
  String? content;
  String? encoding;
  String? message;
  @JsonKey(name: 'documentation_url')
  String? documentationUrl;

  Readme(
      {this.name,
        this.path,
        this.sha,
        this.size,
        this.url,
        this.htmlUrl,
        this.gitUrl,
        this.downloadUrl,
        this.type,
        this.content,
        this.encoding,
        this.message,
        this.documentationUrl});

  factory Readme.fromJson(Map<String, dynamic> json) => _$ReadmeFromJson(json);
  Map<String, dynamic> toJson() => _$ReadmeToJson(this);
}
