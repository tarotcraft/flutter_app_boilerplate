import 'package:flutter_app_boilerplate/common/enums/trending_types.dart';

/// gitter
class GitterConstants {
  static const appName = 'Gitter';

  static const appUserName = 'APP_USERNAME';

  static const licenseDialog = 'LICENSE_DIALOG';

  static const authorizationType = 'AUTHORIZATION_TYPE';

  static const authorizationId = 'AUTHORIZATION_ID';

  static const defaultAuthorizationId = 0;

  static const authorizationToken = 'AUTHORIZATION_TOKEN';

  static const githubApiPrefix = 'https://api.github.com';

  static const githubGraphqlApiEndpoint = 'https://api.github.com/graphql';

  static const githubTrendingApiPrefix = 'https://api.gitterapp.com';

  static const githubOtherApiPrefix = 'https://github.gitterapp.com';

  static const int days = 7;

  static const int timeOut = 20;

  static const int pageSize = 30;

  static const List<String> tabs = [TrendingType.repository, TrendingType.developer];

  static const Map<String, String> headers = {'Accept': 'application/vnd.github.giant-sentry-fist-preview+json'};

}
