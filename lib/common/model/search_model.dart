import 'package:flutter_app_boilerplate/common/model/issue.dart';
import 'package:flutter_app_boilerplate/common/model/organization.dart';
import 'package:flutter_app_boilerplate/common/model/pull_request.dart';
import 'package:flutter_app_boilerplate/common/model/repository.dart';
import 'package:flutter_app_boilerplate/common/model/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class SearchModel<T> {
  @JsonKey(name: 'total_count')
  int? totalCount;
  @JsonKey(name: 'incomplete_results')
  bool? incompleteResults;
  List<T>? items;

  SearchModel({this.totalCount, this.incompleteResults, this.items});

  static SearchModel<T> fromJson<T>(Map<String, dynamic> json) =>
      _$SearchModelFromJson(json, (dynamic json) {
        if (T == User) {
          return User.fromJson(json) as T;
        } else if (T == Organization) {
          return Organization.fromJson(json) as T;
        } else if (T == Issue) {
          return Issue.fromJson(json) as T;
        } else if (T == PullRequest) {
          return PullRequest.fromJson(json) as T;
        } else if (T == Repository) {
          return Repository.fromJson(json) as T;
        } else {
          throw Exception(['"fromJson" not supported.']);
        }
      });

  Map<String, dynamic> toJson() => _$SearchModelToJson(this, (value) {
        if (value != null) {
          if (value is User) {
            return value.toJson();
          } else if (value is Organization) {
            return value.toJson();
          } else if (value is Issue) {
            return value.toJson();
          } else if (value is PullRequest) {
            return value.toJson();
          } else if (value is Repository) {
            return value.toJson();
          } else {
            throw Exception(['"toJson" not supported.']);
          }
        }
      });
}
