
class TrendingDeveloper {
  String? username;
  String? name;
  String? type;
  String? url;
  String? avatar;
  PopularRepository? repo;

  TrendingDeveloper(
      {this.username, this.name, this.type, this.url, this.avatar, this.repo});

  TrendingDeveloper.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    name = json['name'];
    type = json['type'];
    url = json['url'];
    avatar = json['avatar'];
    repo = json['repo'] != null ? PopularRepository.fromJson(json['repo']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['username'] = username;
    data['name'] = name;
    data['type'] = type;
    data['url'] = url;
    data['avatar'] = avatar;
    if (repo != null) {
      data['repo'] = repo!.toJson();
    }
    return data;
  }
}

class PopularRepository {
  String? name;
  String? description;
  String? url;

  PopularRepository({this.name, this.description, this.url});

  PopularRepository.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['url'] = url;
    return data;
  }
}
