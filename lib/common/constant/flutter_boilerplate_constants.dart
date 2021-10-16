import 'package:flutter_app_boilerplate/common/enums/home_types.dart';

/// FlutterBoilerplate
class FlutterBoilerplateConstants {
  static const appName = 'FlutterBoilerplate';

  static const appUserName = 'APP_USERNAME';

  static const licenseDialog = 'LICENSE_DIALOG';

  static const authorizationType = 'AUTHORIZATION_TYPE';

  static const authorizationId = 'AUTHORIZATION_ID';

  static const authorizationToken = 'AUTHORIZATION_TOKEN';

  static const baseUrl = 'https://api.github.com';

  static const int days = 7;

  static const int timeOut = 20;

  static const int pageSize = 30;

  static const List<String> tabs = [HomeType.news, HomeType.notifications];

  static const Map<String, String> headers = {'Accept': 'application/vnd.github.giant-sentry-fist-preview+json'};

}
