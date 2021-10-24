import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_boilerplate/common/constant/flutter_boilerplate_constants.dart';
import 'package:flutter_app_boilerplate/common/flutter_app_boilerplate_manager.dart';
import 'package:flutter_app_boilerplate/common/utils/cache_util.dart';
import 'package:flutter_app_boilerplate/common/utils/logger_util.dart';
import 'package:flutter_app_boilerplate/common/utils/navigator_util.dart';
import 'package:flutter_app_boilerplate/common/utils/object_util.dart';
import 'package:flutter_app_boilerplate/ui/pages/tab_navigator.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Duration get loginTime => const Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: data.name,
          password: data.password
      );
      User? user = userCredential.user;
      if (user!= null) {
        FlutterBoilerplateManager().user = user;
        await CacheUtil.setCache(FlutterBoilerplateConstants.authorizationEmail, data.name);
        await CacheUtil.setCache(FlutterBoilerplateConstants.authorizationPassword, data.password);
        NavigatorUtil.pushReplacement(context, const TabNavigator());
        if (!user.emailVerified) {
          await user.sendEmailVerification();
        }
      }
    } on FirebaseAuthException catch (e) {
      printErrorLog(e);
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      }
    } catch (e) {
      printErrorLog(e);
    }
    return null;
  }

  Future<String?> _recoverPassword(String name) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: name);
    } on FirebaseAuthException catch (e) {
      printErrorLog(e);
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      }
    } catch (e) {
      printErrorLog(e);
    }
    return null;
  }

  Future<String?> _signupUser(SignupData data) async {
    if(ObjectUtil.isNull(data.name)) {
      return "email is empty";
    }
    if(ObjectUtil.isNull(data.password)) {
      return "password is empty";
    }
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: data.name!,
          password: data.password!
      );
      User? user = userCredential.user;
      if (user!= null) {
        FlutterBoilerplateManager().user = user;
        await CacheUtil.setCache(FlutterBoilerplateConstants.authorizationEmail, data.name);
        await CacheUtil.setCache(FlutterBoilerplateConstants.authorizationPassword, data.password);
        NavigatorUtil.pushReplacement(context, const TabNavigator());
        if (!user.emailVerified) {
          await user.sendEmailVerification();
        }
      }
    } on FirebaseAuthException catch (e) {
      printErrorLog(e);
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
    } catch (e) {
      printErrorLog(e);
    }
    return null;
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
