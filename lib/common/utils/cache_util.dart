import 'dart:convert';
import 'package:flutter_app_boilerplate/common/model/authorization.dart';
import 'package:flutter_app_boilerplate/common/model/branch.dart';
import 'package:flutter_app_boilerplate/common/model/content.dart';
import 'package:flutter_app_boilerplate/common/model/contribution.dart';
import 'package:flutter_app_boilerplate/common/model/contributor.dart';
import 'package:flutter_app_boilerplate/common/model/issue.dart';
import 'package:flutter_app_boilerplate/common/model/language_model.dart';
import 'package:flutter_app_boilerplate/common/model/pull_request.dart';
import 'package:flutter_app_boilerplate/common/model/readme.dart';
import 'package:flutter_app_boilerplate/common/model/release.dart';
import 'package:flutter_app_boilerplate/common/model/repository.dart';
import 'package:flutter_app_boilerplate/common/model/repository_pulls_model.dart';
import 'package:flutter_app_boilerplate/common/model/tree.dart';
import 'package:flutter_app_boilerplate/common/model/trending_developer.dart';
import 'package:flutter_app_boilerplate/common/model/trending_repository.dart';
import 'package:flutter_app_boilerplate/common/model/user_detail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheUtil {

  static Future<bool> removeCache(String key) async {
    var prefs = await SharedPreferences.getInstance();
    return await prefs.remove(key);
  }

  static Future<bool> clearCache(String key) async {
    var prefs = await SharedPreferences.getInstance();
    return await prefs.clear();
  }

  static Future<bool> setCache(String key, dynamic data) async {
    var prefs = await SharedPreferences.getInstance();
    var datas = {
      'data': data,
      'timestamp': DateTime.now().millisecondsSinceEpoch
    };
    return await prefs.setString(
        key, json.encode(datas));
  }

  static Future<T?> getCache<T>(
    String key, {
    int times = 2 * 60 * 60 * 1000,
    bool checkValidTimes = true,
    T? defaultValue,
    Function(dynamic dataList)? converter,
  }) async {
    var prefs = await SharedPreferences.getInstance();
    var data = prefs.getString(key);
    if (data == null || data.isEmpty) return defaultValue;
    var mapData = (json.decode(data) as Map);
    var timestamp = mapData['timestamp'];
    if (checkValidTimes && (DateTime.now().millisecondsSinceEpoch - timestamp) > times) {
      return defaultValue;
    }
    var dataList = mapData['data'];
    if(dataList == null && defaultValue != null) {
      return defaultValue;
    }
    return converter == null || dataList == null ? dataList : converter(dataList);
  }
}

dynamic myEncode(dynamic item) {
  if (item is TrendingRepository) {
    return item.toJson();
  } else if (item is RepositoryBuildBy) {
    return item.toJson();
  } else if (item is TrendingDeveloper) {
    return item.toJson();
  } else if (item is PopularRepository) {
    return item.toJson();
  } else if (item is Language) {
    return item.toJson();
  } else if (item is Contribution) {
    return item.toJson();
  } else if (item is UserDetail) {
    return item.toJson();
  } else if (item is Repository) {
    return item.toJson();
  } else if (item is Issue) {
    return item.toJson();
  } else if (item is PullRequest) {
    return item.toJson();
  } else if (item is Contributor) {
    return item.toJson();
  } else if (item is Branch) {
    return item.toJson();
  } else if (item is Readme) {
    return item.toJson();
  } else if (item is RepositoryPullsModel) {
    return item.toJson();
  } else if (item is Tree) {
    return item.toJson();
  } else if (item is Content) {
    return item.toJson();
  } else if (item is Release) {
    return item.toJson();
  } else if (item is Authorization) {
    return item.toJson();
  }
  return item;
}
