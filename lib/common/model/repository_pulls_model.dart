import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_app_boilerplate/common/model/issue.dart';
part 'repository_pulls_model.g.dart';

@JsonSerializable()
class RepositoryPullsModel {
  @JsonKey(name: 'total_count')
  int? totalCount;
  @JsonKey(name: 'incomplete_results')
  bool? incompleteResults;
  List<Issue>? items;

  RepositoryPullsModel({this.totalCount, this.incompleteResults, this.items});

  factory RepositoryPullsModel.fromJson(Map<String, dynamic> json) => _$RepositoryPullsModelFromJson(json);
  Map<String, dynamic> toJson() => _$RepositoryPullsModelToJson(this);
}
