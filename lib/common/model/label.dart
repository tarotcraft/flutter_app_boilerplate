import 'package:json_annotation/json_annotation.dart';
part 'label.g.dart';

@JsonSerializable()
class Label {
  int? id;
  @JsonKey(name: 'node_id')
  String? nodeId;
  String? url;
  String? name;
  String? color;
  @JsonKey(name: 'default')
  bool? defaultBool;

  Label(
      {this.id,
      this.nodeId,
      this.url,
      this.name,
      this.color,
      this.defaultBool});

  factory Label.fromJson(Map<String, dynamic> json) => _$LabelFromJson(json);
  Map<String, dynamic> toJson() => _$LabelToJson(this);

}
