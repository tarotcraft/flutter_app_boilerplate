import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_boilerplate/common/constant/flutter_boilerplate_constants.dart';
import 'package:flutter_app_boilerplate/common/flutter_app_boilerplate_manager.dart';
import 'package:flutter_app_boilerplate/common/utils/cache_util.dart';
import 'package:flutter_app_boilerplate/common/utils/logger_util.dart';
import 'package:flutter_app_boilerplate/common/utils/navigator_util.dart';
import 'package:flutter_app_boilerplate/common/utils/object_util.dart';
import 'package:flutter_app_boilerplate/common/utils/string_util.dart';
import 'package:flutter_app_boilerplate/ui/pages/tab_navigator.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

/// Generates a cryptographically secure random nonce, to be included in a
/// credential request.
String generateNonce([int length = 32]) {
  const charset =
      '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
  final random = Random.secure();
  return List.generate(length, (_) => charset[random.nextInt(charset.length)])
      .join();
}

/// Returns the sha256 hash of [input] in hex notation.
String sha256ofString(String input) {
  final bytes = utf8.encode(input);
  final digest = sha256.convert(bytes);
  return digest.toString();
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Duration get loginTime => const Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: data.name, password: data.password);
      User? user = userCredential.user;
      if (user != null) {
        FlutterBoilerplateManager().user = user;
        await CacheUtil.setCache(
            FlutterBoilerplateConstants.authorizationEmail, data.name);
        await CacheUtil.setCache(
            FlutterBoilerplateConstants.authorizationPassword, data.password);
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
      await CacheUtil.setCache(
          FlutterBoilerplateConstants.authorizationEmail, StringUtil.empty);
      await CacheUtil.setCache(
          FlutterBoilerplateConstants.authorizationPassword, StringUtil.empty);
      NavigatorUtil.pushReplacement(context, const LoginPage());
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
    if (ObjectUtil.isNull(data.name)) {
      return "email is empty";
    }
    if (ObjectUtil.isNull(data.password)) {
      return "password is empty";
    }
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: data.name!, password: data.password!);
      User? user = userCredential.user;
      if (user != null) {
        FlutterBoilerplateManager().user = user;
        await CacheUtil.setCache(
            FlutterBoilerplateConstants.authorizationEmail, data.name);
        await CacheUtil.setCache(
            FlutterBoilerplateConstants.authorizationPassword, data.password);
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

  Future<String?> _signInWithApple() async {
    // To prevent replay attacks with the credential returned from Apple, we
    // include a nonce in the credential request. When signing in with
    // Firebase, the nonce in the id token returned by Apple, is expected to
    // match the sha256 hash of `rawNonce`.
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    // Request credential for the currently signed in Apple account.
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );

    // Create an `OAuthCredential` from the credential returned by Apple.
    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
    );

    // Sign in the user with Firebase. If the nonce we generated earlier does
    // not match the nonce in `appleCredential.identityToken`, sign in will fail.
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(oauthCredential);
      User? user = userCredential.user;
      if (user != null) {
        FlutterBoilerplateManager().user = user;
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
            callback: _signInWithApple,
          ),
        ],
      ],
      onRecoverPassword: _recoverPassword,
      footer:
          '${FlutterBoilerplateManager().version}+${FlutterBoilerplateManager().buildNumber}\n',
    );
  }
}
