import 'package:json_annotation/json_annotation.dart';
part 'branch.g.dart';

@JsonSerializable()
class Branch {
  String? name;
  Commit? commit;
  bool? protected;
  Protection? protection;
  @JsonKey(name: 'protection_url')
  String? protectionUrl;

  Branch(
      {this.name,
        this.commit,
        this.protected,
        this.protection,
        this.protectionUrl});

  factory Branch.fromJson(Map<String, dynamic> json) => _$BranchFromJson(json);
  Map<String, dynamic> toJson() => _$BranchToJson(this);

}

@JsonSerializable()
class Commit {
  String? sha;
  String? url;

  Commit({this.sha, this.url});

  factory Commit.fromJson(Map<String, dynamic> json) => _$CommitFromJson(json);
  Map<String, dynamic> toJson() => _$CommitToJson(this);

}

@JsonSerializable()
class Protection {
  bool? enabled;
  @JsonKey(name: 'required_status_checks')
  RequiredStatusChecks? requiredStatusChecks;

  Protection({this.enabled, this.requiredStatusChecks});

  factory Protection.fromJson(Map<String, dynamic> json) => _$ProtectionFromJson(json);
  Map<String, dynamic> toJson() => _$ProtectionToJson(this);

}

@JsonSerializable()
class RequiredStatusChecks {
  @JsonKey(name: 'enforcement_level')
  String? enforcementLevel;
  List<String>? contexts;

  RequiredStatusChecks({this.enforcementLevel, this.contexts});

  factory RequiredStatusChecks.fromJson(Map<String, dynamic> json) => _$RequiredStatusChecksFromJson(json);
  Map<String, dynamic> toJson() => _$RequiredStatusChecksToJson(this);

}
