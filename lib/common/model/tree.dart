import 'package:json_annotation/json_annotation.dart';
part 'tree.g.dart';

@JsonSerializable()
class Tree {
  String? path;
  String? mode;
  String? type;
  String? sha;
  int? size;
  String? url;

  Tree({this.path, this.mode, this.type, this.sha, this.size, this.url});

  factory Tree.fromJson(Map<String, dynamic> json) => _$TreeFromJson(json);
  Map<String, dynamic> toJson() => _$TreeToJson(this);
}
