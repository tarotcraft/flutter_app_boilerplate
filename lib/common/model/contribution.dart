class Contribution {
  int? count;
  String? color;
  String? date;

  Contribution({this.count, this.color, this.date});

  Contribution.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    color = json['color'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['count'] = count;
    data['color'] = color;
    data['date'] = date;
    return data;
  }
}
