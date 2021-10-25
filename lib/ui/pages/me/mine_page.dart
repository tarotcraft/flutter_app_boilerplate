import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_boilerplate/ui/pages/me/user_settings_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app_boilerplate/common/constant/me_constants.dart';
import 'package:flutter_gen/gen_l10n/flutter_boilerplate_localizations.dart';
import 'package:flutter_app_boilerplate/ui/blocs/bottom_tabs/bottom_tabs_bloc.dart';
import 'package:flutter_app_boilerplate/ui/blocs/me/dark_mode/dark_mode_bloc.dart';
import 'package:flutter_app_boilerplate/ui/widgets/error_page.dart';

const String urlString = 'https://readme.gitterapp.com';

class MinePage extends StatefulWidget {
  const MinePage({
    Key? key,
  }) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage>
    with AutomaticKeepAliveClientMixin {
  static const EdgeInsetsGeometry _padding =
      EdgeInsets.only(left: 14, right: 8);
  static const EdgeInsetsGeometry _margin = EdgeInsets.only(top: 8);

  Exception? _error;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DarkModeBloc, DarkModeState>(
      builder: (ctx, darkModeState) => Scaffold(
        appBar: AppBar(
          title: Text(
            FlutterBoilerplateLocalizations.of(context)!.tabMeTitle,
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

  Future<void> _handleRefresh() async {}

  @override
  bool get wantKeepAlive => true;
}
