import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app_boilerplate/common/constant/flutter_boilerplate_constants.dart';
import 'package:flutter_app_boilerplate/common/flutter_app_boilerplate_manager.dart';
import 'package:flutter_app_boilerplate/common/utils/logger_util.dart';
import 'package:flutter_app_boilerplate/ui/pages/tab_navigator.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const users = {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) {
    printWarningLog('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'User not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  Future<String?> _recoverPassword(String name) {
    printWarningLog('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return null;
    });
  }

  Future<String?> _signupUser(SignupData data) {
    printWarningLog('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'User not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    return FlutterLogin(
      title: FlutterBoilerplateConstants.appName,
      theme: LoginTheme(
        pageColorDark: _theme.colorScheme.background,
        pageColorLight: _theme.colorScheme.background,
        titleStyle: TextStyle(fontSize: 24, color: _theme.primaryColor),
      ),
      onLogin: _authUser,
      onSignup: _signupUser,
      loginProviders: <LoginProvider>[
        if (Platform.isIOS) ...[
          LoginProvider(
            icon: FontAwesomeIcons.appleAlt,
            callback: () async {
              printInfoLog('start apple sign in');
              await Future.delayed(loginTime);
              printInfoLog('stop apple sign in');
              return null;
            },
          ),
        ],
      ],
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const TabNavigator(),
        ));
      },
      onRecoverPassword: _recoverPassword,
      footer: '${FlutterBoilerplateManager().version}+${FlutterBoilerplateManager().buildNumber}',
    );
  }
}
