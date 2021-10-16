import 'package:flutter_app_boilerplate/common/model/repository.dart';

class SearchRepository {
  int? totalCount;
  bool? incompleteResults;
  List<Repository>? items;

  SearchRepository({this.totalCount, this.incompleteResults, this.items});

  SearchRepository.fromJson(Map<String, dynamic> json) {
    totalCount = json['total_count'];
    incompleteResults = json['incomplete_results'];
    if (json['items'] != null) {
      items = <Repository>[];
      json['items'].forEach((v) {
        items!.add(Repository.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['total_count'] = totalCount;
    data['incomplete_results'] = incompleteResults;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
