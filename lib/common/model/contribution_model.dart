import 'package:flutter_app_boilerplate/common/model/contribution.dart';

class ContributionModel {
  String? total;
  List<Contribution?>? contributions;

  ContributionModel({
    this.total,
    this.contributions,
  });

  ContributionModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['contributions'] != null) {
      contributions = <Contribution?>[];
      json['contributions'].forEach((v) {
        contributions!.add(Contribution.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['total'] = total;
    if (contributions != null) {
      data['contributions'] = contributions!.map((v) => v!.toJson()).toList();
    }
    return data;
  }
}
