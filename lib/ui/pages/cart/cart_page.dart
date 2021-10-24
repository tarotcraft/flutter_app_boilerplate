import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_boilerplate/common/constant/flutter_boilerplate_constants.dart';
import 'package:flutter_app_boilerplate/common/flutter_app_boilerplate_manager.dart';
import 'package:flutter_app_boilerplate/common/utils/cache_util.dart';
import 'package:flutter_app_boilerplate/common/utils/navigator_util.dart';
import 'package:flutter_app_boilerplate/common/utils/string_util.dart';
import 'package:flutter_app_boilerplate/ui/pages/login_page.dart';
import 'package:flutter_gen/gen_l10n/flutter_boilerplate_localizations.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          FlutterBoilerplateLocalizations.of(context)!.tabCartTitle,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
                "displayName: ${FlutterBoilerplateManager().user?.displayName}"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
                "email: ${FlutterBoilerplateManager().user?.email}"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
                "emailVerified: ${FlutterBoilerplateManager().user?.emailVerified}"),
          ),Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
                "isAnonymous: ${FlutterBoilerplateManager().user?.isAnonymous}"),
          ),Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
                "phoneNumber: ${FlutterBoilerplateManager().user?.phoneNumber}"),
          ),Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
                "photoURL: ${FlutterBoilerplateManager().user?.photoURL}"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
                "refreshToken: ${FlutterBoilerplateManager().user?.refreshToken}"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
                "tenantId: ${FlutterBoilerplateManager().user?.tenantId}"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
                "uid: ${FlutterBoilerplateManager().user?.uid}"),
          ),
          TextButton(
            onPressed: () async {
              FirebaseAuth.instance.signOut();
              await CacheUtil.setCache(
                  FlutterBoilerplateConstants.authorizationEmail,
                  StringUtil.empty);
              await CacheUtil.setCache(
                  FlutterBoilerplateConstants.authorizationPassword,
                  StringUtil.empty);
              NavigatorUtil.push(context, const LoginPage());
            },
            child: const Text("Logout"),
          )
        ],
      ),
    );
  }
}
