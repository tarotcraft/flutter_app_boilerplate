/// trending repositories model
class TrendingRepository {
  String? author;
  String? name;
  String? avatar;
  String? url;
  String? description;
  String? language;
  String? languageColor;
  int? stars;
  int? forks;
  int? currentPeriodStars;
  List<RepositoryBuildBy>? builtBy;

  TrendingRepository(
      {this.author,
        this.name,
        this.avatar,
        this.url,
        this.description,
        this.language,
        this.languageColor,
        this.stars,
        this.forks,
        this.currentPeriodStars,
        this.builtBy});

  TrendingRepository.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    name = json['name'];
    avatar = json['avatar'];
    url = json['url'];
    description = json['description'];
    language = json['language'];
    languageColor = json['languageColor'];
    stars = json['stars'];
    forks = json['forks'];
    currentPeriodStars = json['currentPeriodStars'];
    if (json['builtBy'] != null) {
      builtBy = <RepositoryBuildBy>[];
      json['builtBy'].forEach((v) {
        builtBy!.add(RepositoryBuildBy.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['author'] = author;
    data['name'] = name;
    data['avatar'] = avatar;
    data['url'] = url;
    data['description'] = description;
    data['language'] = language;
    data['languageColor'] = languageColor;
    data['stars'] = stars;
    data['forks'] = forks;
    data['currentPeriodStars'] = currentPeriodStars;
    if (builtBy != null) {
      data['builtBy'] = builtBy!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RepositoryBuildBy {
  String? href;
  String? avatar;
  String? username;

  RepositoryBuildBy({this.href, this.avatar, this.username});

  RepositoryBuildBy.fromJson(Map<String, dynamic> json) {
    href = json['href'];
    avatar = json['avatar'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['href'] = href;
    data['avatar'] = avatar;
    data['username'] = username;
    return data;
  }
}
