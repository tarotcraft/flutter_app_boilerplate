import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_boilerplate/common/constant/flutter_boilerplate_constants.dart';
import 'package:flutter_app_boilerplate/common/constant/home_constants.dart';
import 'package:flutter_app_boilerplate/common/enums/home_types.dart';
import 'package:flutter_app_boilerplate/ui/pages/home/news_page.dart';
import 'package:flutter_app_boilerplate/ui/pages/home/notifiactions_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app_boilerplate/common/model/language_model.dart';
import 'package:flutter_app_boilerplate/common/utils/logger_util.dart';
import 'package:flutter_app_boilerplate/ui/blocs/bottom_tabs/bottom_tabs_bloc.dart';
import 'package:flutter_app_boilerplate/ui/blocs/option/options_bloc.dart';
import 'package:flutter_app_boilerplate/ui/blocs/trending/trending_bloc.dart';
import 'package:flutter_app_boilerplate/ui/widgets/option_dialog.dart';

const newsName = 'News';
const notificationsName = 'Notifications';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TabController? _controller;

  @override
  void initState() {
    final trendingBloc = BlocProvider.of<TrendingBloc>(context);
    final currentTab = trendingBloc.state.currentTab;
    final initialIndex = currentTab == HomeType.news ? 0 : 1;
    _controller = TabController(
        initialIndex: initialIndex,
        length: FlutterBoilerplateConstants.tabs.length,
        vsync: this)
      ..addListener(() {
        final currentTab = FlutterBoilerplateConstants.tabs[_controller!.index];
        BlocProvider.of<TrendingBloc>(context)
            .add(TrendingAddEvent(currentTab));
      });

    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var _theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<TrendingBloc, TrendingState>(
          builder: (context, state) => SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        HomeType.news == state.currentTab ? newsName : notificationsName,
                      ),
                    ),
                    DotsIndicator(
                      onTap: (index) {
                        printInfoLog(index);
                      },
                      dotsCount: FlutterBoilerplateConstants.tabs.length,
                      position:
                          HomeType.news == state.currentTab ? 0 : 1,
                      decorator: DotsDecorator(
                        size: const Size.square(9.0),
                        color: _theme.bottomAppBarColor,
                        activeSize: const Size(18.0, 9.0),
                        activeColor: _theme.primaryColor,
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  right: 2,
                  child: GestureDetector(
                    onTap: () => _selectTrendingOption(state.currentTab),
                    child: Container(
                      padding: const EdgeInsets.only(right: 14),
                      child: const Icon(
                        Icons.filter_alt_outlined,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: BlocBuilder<TrendingBloc, TrendingState>(
        builder: (BuildContext context, TrendingState trending1State) =>
            BlocBuilder<OptionsBloc, OptionsState>(
          builder: (BuildContext context, OptionsState optionsState) =>
              BlocBuilder<BottomTabsBloc, BottomTabsState>(
                  builder: (context, bottomTabsState) {
            if (bottomTabsState.refresh &&
                bottomTabsState.module == HomeConstants.module) {
              BlocProvider.of<BottomTabsBloc>(context)
                  .add(const BottomTabsInitEvent(false, HomeConstants.module));
              Future.delayed(const Duration(milliseconds: 500), () {
                _reloadData(trending1State.currentTab, true);
              });
            }
            return TabBarView(
              controller: _controller,
              children: const [
                NewsPage(),
                NotificationsPage(),
              ],
            );
          }),
        ),
      ),
    );
  }

  void _selectTrendingOption(String? currentTab) {
    Navigator.push(
        context,
        MaterialPageRoute<OptionDialogAction>(
          builder: (BuildContext context) => OptionDialog(
            tabs: HomeConstants.dialogTabs,
            tabNames: HomeConstants.dialogTabNames,
            selectSince: (index) {
              BlocProvider.of<OptionsBloc>(context)
                  .add(OptionsTabIndexAddEvent(index, null, currentTab));
              Future.delayed(const Duration(milliseconds: 200), () {
                _reloadData(currentTab, false);
              });
            },
            selectLanguage: (Language language) {
              BlocProvider.of<OptionsBloc>(context)
                  .add(OptionsLanguageAddEvent(null, language, currentTab));
              Future.delayed(const Duration(milliseconds: 200), () {
                _reloadData(currentTab, false);
              });
            },
          ),
          fullscreenDialog: true,
        ));
  }

  void _reloadData(String? currentTab, bool pullDown) {
    final optionsBloc = BlocProvider.of<OptionsBloc>(context);
    var language = optionsBloc.state.optionLanguage!.text;
    var since = describeEnum(
        HomeConstants.dialogTabs[optionsBloc.state.optionTabIndex!]);
    _loadDataByTab(currentTab, since, language, pullDown);
  }

  void _loadDataByTab(
      String? currentTab, String since, String? language, bool pullDown) {
    if (currentTab == HomeType.news) {
      // TODO: do something.
    } else {
      // TODO: do something.
    }
  }

  @override
  bool get wantKeepAlive => true;
}
