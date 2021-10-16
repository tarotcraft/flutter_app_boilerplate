import 'package:flutter_app_boilerplate/common/constant/me_constants.dart';
import 'package:flutter_app_boilerplate/common/constant/news_constants.dart';
import 'package:flutter_app_boilerplate/common/constant/search_constants.dart';
import 'package:flutter_app_boilerplate/common/constant/stars_constants.dart';
import 'package:flutter_app_boilerplate/common/constant/trending_constants.dart';
import 'package:flutter_app_boilerplate/common/model/tab.dart';

List<Tab> bottomTabs = [
  Tab(iconData: 0xe639, text: TrendingConstants.module),
  Tab(iconData: 0xe640, text: NewsConstants.module),
  Tab(iconData: 0xe63f, text: SearchConstants.module),
  Tab(iconData: 0xe644, text: StarsConstants.module),
  Tab(iconData: 0xe65c, text: MeConstants.module),
];
