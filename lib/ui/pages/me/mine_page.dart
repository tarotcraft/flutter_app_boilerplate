import 'dart:convert';
import 'dart:core';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_boilerplate/ui/pages/me/user_settings_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_app_boilerplate/common/constant/me_constants.dart';
import 'package:flutter_app_boilerplate/common/utils/dark_mode_util.dart';
import 'package:flutter_app_boilerplate/common/utils/logger_util.dart';
import 'package:flutter_app_boilerplate/common/utils/object_util.dart';
import 'package:flutter_gen/gen_l10n/gitter_localizations.dart';
import 'package:flutter_app_boilerplate/ui/blocs/bottom_tabs/bottom_tabs_bloc.dart';
import 'package:flutter_app_boilerplate/ui/blocs/me/dark_mode/dark_mode_bloc.dart';
import 'package:flutter_app_boilerplate/ui/blocs/me/l10n/l10n_bloc.dart';
import 'package:flutter_app_boilerplate/ui/blocs/me/theme/theme_bloc.dart';
import 'package:flutter_app_boilerplate/ui/widgets/error_page.dart';

const String urlString = 'https://readme.gitterapp.com';

class MinePage extends StatefulWidget {
  const MinePage({
    Key? key,
  }) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  static const EdgeInsetsGeometry _padding =
      EdgeInsets.only(left: 14, right: 8);
  static const EdgeInsetsGeometry _margin = EdgeInsets.only(top: 8);
  final CookieManager _cookieManager = CookieManager.instance();

  Exception? _error;
  double _readmePixel = 0;
  late InAppWebViewController _appWebViewController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DarkModeBloc, DarkModeState>(
      builder: (ctx, darkModeState) => Scaffold(
        appBar: AppBar(
          title: Text(
            GitterLocalizations.of(context)!.tabMeTitle,
          ),
        ),
        body: BlocBuilder<BottomTabsBloc, BottomTabsState>(
            builder: (context, bottomTabsState) {
          if (bottomTabsState.refresh &&
              bottomTabsState.module == MeConstants.module) {
            BlocProvider.of<BottomTabsBloc>(context)
                .add(const BottomTabsInitEvent(false, MeConstants.module));
            Future.delayed(const Duration(milliseconds: 500), () {
              _handleRefresh();
            });
          }
          return MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: _error == null
                ? RefreshIndicator(
                    onRefresh: _handleRefresh,
                    child: ListView(
                      children: [
                        _readmeContent,
                        Container(
                          margin: _margin,
                          padding: _padding,
                          child: const UserSettingsPage(),
                        ),
                      ],
                    ),
                  )
                : ErrorPage(
                    reload: _handleRefresh,
                  ),
          );
        }),
      ),
    );
  }

  Widget get _readmeContent {
    return MultiBlocListener(
      listeners: [
        BlocListener<DarkModeBloc, DarkModeState>(
          listener: (context, state) async {
            var isDarkMode = DarkModeUtil.isDarkMode(context, state.themeMode);
            var data = {
              "darkMode": isDarkMode ? 'dark' : 'light',
            };
            await _transportToWeb(json.encode(data));
          },
        ),
        BlocListener<L10nBloc, L10nState>(
          listener: (context, state) async {
            var defaultLocale = WidgetsBinding.instance!.window.locale;
            var locale = state.locale ?? defaultLocale;
            var data = {
              "locale": locale.toString(),
            };
            await _transportToWeb(json.encode(data));
          },
        ),
        BlocListener<ThemeBloc, ThemeState>(
          listener: (context, state) async {
            var color = state.color ?? Theme.of(context).primaryColor;
            var data = {"color": color};
            await _transportToWeb(json.encode(data));
          },
        ),
      ],
      child: Container(
        margin: _margin,
        padding: _padding,
        child: SizedBox(
          height: _readmePixel,
          child: InAppWebView(
            initialUrlRequest: URLRequest(
              url: Uri.tryParse(urlString),
            ),
            initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
                cacheEnabled: false,
                clearCache: true,
              ),
            ),
            onWebViewCreated: (InAppWebViewController controller) async {
              setState(() {
                _appWebViewController = controller;
              });
              await _initCookieManager();
              controller.addJavaScriptHandler(
                  handlerName: 'expandReadme',
                  callback: (args) {
                    // print arguments coming from the JavaScript side!
                    printInfoLog(args[0]);
                    if (ObjectUtil.isNotNull(args) && args.isNotEmpty) {
                      setState(() {
                        _readmePixel = args[0];
                      });
                    }

                    // return data to the JavaScript side!
                    return {
                      'result': true,
                    };
                  });
            },
            onLoadError: (InAppWebViewController controller, Uri? url, int code,
                String message) {
              printErrorLog('code: $code, message: $message');
            },
            onLoadHttpError: (InAppWebViewController controller, Uri? url,
                int statusCode, String description) {
              printErrorLog(
                  'statusCode: $statusCode, description: $description');
            },
            onLoadStop: (InAppWebViewController controller, Uri? url) async {
              setState(() {
                _readmePixel = 300;
              });
              var themeMode =
                  BlocProvider.of<DarkModeBloc>(context).state.themeMode;
              var defaultLocale = WidgetsBinding.instance!.window.locale;
              var locale = BlocProvider.of<L10nBloc>(context).state.locale ??
                  defaultLocale;
              var isDarkMode = DarkModeUtil.isDarkMode(context, themeMode);
              var color = BlocProvider.of<ThemeBloc>(context).state.color ??
                  Theme.of(context).primaryColor;
              var data = {
                "darkMode": isDarkMode ? 'dark' : 'light',
                "locale": locale.toString(),
                "color": color
              };
              await _transportToWeb(json.encode(data));
            },
            onConsoleMessage: (InAppWebViewController controller,
                ConsoleMessage consoleMessage) {
              printWarningLog('consoleMessage: $consoleMessage');
            },
          ),
        ),
      ),
    );
  }

  Future<void> _transportToWeb(data) async {
    if (!Platform.isAndroid ||
        await AndroidWebViewFeature.isFeatureSupported(
            AndroidWebViewFeature.CREATE_WEB_MESSAGE_CHANNEL)) {
      // wait until the page is loaded, and then create the Web Message Channel
      var webMessageChannel =
          await _appWebViewController.createWebMessageChannel();
      var port1 = webMessageChannel!.port1;
      var port2 = webMessageChannel.port2;

      // set the web message callback for the port1
      await port1.setWebMessageCallback((message) async {
        printWarningLog("Message coming from the JavaScript side: $message");
        // when it receives a message from the JavaScript side, respond back with another message.
        await port1.postMessage(WebMessage(data: message! + " and back"));
      });

      // transfer port2 to the webpage to initialize the communication
      await _appWebViewController.postWebMessage(
          message: WebMessage(data: data, ports: [port2]),
          targetOrigin: Uri.parse("*"));
    }
  }

  Future<void> _handleRefresh() async {
    setState(() {
      _readmePixel = 0;
    });
  }

  Future<void> _initCookieManager() async {
    Uri? url = Uri.tryParse(urlString);
    final expiresDate =
        DateTime.now().add(const Duration(days: 7)).millisecondsSinceEpoch;
    // TODO: do something.
  }
}
