import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show describeEnum;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app_boilerplate/common/mock/languages.dart';
import 'package:flutter_app_boilerplate/common/model/language_model.dart';
import 'package:flutter_app_boilerplate/common/utils/color_util.dart';
import 'package:flutter_app_boilerplate/common/utils/navigator_util.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:flutter_app_boilerplate/common/utils/string_util.dart';
import 'package:flutter_app_boilerplate/ui/blocs/option/options_bloc.dart';
import 'package:flutter_app_boilerplate/ui/widgets/search.dart';

enum OptionDialogAction {
  cancel,
  discard,
  save,
}

const double sliverHeaderHeight = 26;
const double sliverItemHeight = 40;
const double keyItemWidth = 20;
const double keyItemHeight = 16;

class OptionDialog extends StatefulWidget {
  final List<dynamic> tabs;
  final List<String> tabNames;
  final Function? loadSince;
  final Function? loadLanguage;
  final Function? selectSince;
  final Function? selectLanguage;

  const OptionDialog({
    Key? key,
    this.tabs = const [],
    this.tabNames = const [],
    this.loadSince,
    this.loadLanguage,
    this.selectSince,
    this.selectLanguage,
  }) : super(key: key);

  @override
  _OptionDialogState createState() => _OptionDialogState();
}

class _OptionDialogState extends State<OptionDialog>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  Map<String, List<dynamic>> languagesMap = {};
  final ScrollController _scrollController = ScrollController();
  List<Language> languagesList = [];
  List<Language> _languagesBySearch = [];
  String _inputText = StringUtil.empty;
  int currentKeyIndex = 0;

  @override
  void initState() {
    _loadLanguages();
    _scrollController.addListener(() {
      _onScroll(_scrollController.position.pixels);
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _loadCurrentSince();
    _loadCurrentLanguage();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => NavigatorUtil.pop(context),
          child: const Padding(
            padding: EdgeInsets.all(6),
            child: Icon(
              Icons.close,
              size: 20,
            ),
          ),
        ),
        title: SizedBox(
          height: 24,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _optionTabs,
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context, OptionDialogAction.save);
            },
            child: const Text(
              '完成',
            ),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          _searchBar,
          Container(
            padding: const EdgeInsets.only(top: 50),
            child: _inputText == StringUtil.empty
                ? BlocBuilder<OptionsBloc, OptionsState>(
                    builder: (context, state) => CustomScrollView(
                      controller: _scrollController,
                      slivers: _buildSlivers(context, state.optionLanguage!),
                    ),
                  )
                : _searchList,
          ),
          if(StringUtil.isBlank(_inputText)) ...[
            Positioned(
              right: 4,
              top: (MediaQuery.of(context).size.height - _getSortedKeys.length * keyItemHeight) / 2 - 36,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                width: keyItemWidth,
                height: _getSortedKeys.length * keyItemHeight,
                child: _getListKeys,
              ),
            )
          ],
        ],
      ),
    );
  }

  List<Widget> get _optionTabs {
    var options = <Widget>[];
    widget.tabs.asMap().forEach((index, tab) {
      options.add(_buildTab(index == 0, index == (widget.tabs.length - 1),
          index, describeEnum(tab)));
    });
    return options;
  }

  Widget _buildTab(bool first, bool last, int index, String tab) {
    return GestureDetector(
      onTap: () {
        _clickSinceTab(index);
        NavigatorUtil.pop(context);
      },
      child: BlocBuilder<OptionsBloc, OptionsState>(
        builder: (context, state) => Container(
          padding: const EdgeInsets.fromLTRB(4, 3, 4, 3),
          decoration:
              _buildDecoration(first, last, index, state.optionTabIndex),
          child: SizedBox(
            width: 70,
            child: Text(
              widget.tabNames.isEmpty
                  ? tab
                  : widget.tabNames[index],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Decoration _buildDecoration(
      bool first, bool last, int index, int? optionTabIndex) {
    var _theme = Theme.of(context);
    if (first && last) {
      return BoxDecoration(
        color: index == optionTabIndex ? _theme.primaryColor : Colors.white,
        border: Border.all(width: 0.4),
        borderRadius: BorderRadius.circular(4),
      );
    } else if (first) {
      return BoxDecoration(
        color: index == optionTabIndex ? _theme.primaryColor : Colors.white,
        border: Border.all(width: 0.4),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(4),
          bottomLeft: Radius.circular(4),
        ),
      );
    } else if (last) {
      return BoxDecoration(
        color: index == optionTabIndex ? _theme.primaryColor : Colors.white,
        border: Border.all(width: 0.4),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(4),
          bottomRight: Radius.circular(4),
        ),
      );
    } else {
      return BoxDecoration(
        color: index == optionTabIndex ? _theme.primaryColor : Colors.white,
        border: Border.all(width: 0.4),
      );
    }
  }

  Widget get _searchBar {
    return SizedBox(
      height: 50,
      child: Search(
        hint: '搜索',
        hideLeft: true,
        hideRight: true,
        hideSpeak: true,
        onChanged: _onInputChanged,
        onSubmitted: _onInputSubmitted,
      ),
    );
  }

  Widget get _searchList {
    return _languagesBySearch.isEmpty
        ? const Center(
          child: Text(
            '哎呦喂, 搜索值迷路了!',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        )
        : ListView(
            children: ListTile.divideTiles(
                    context: context,
                    tiles: _buildListTiles(context, _languagesBySearch))
                .toList(),
          );
  }

  List<Widget> _buildSlivers(BuildContext context, Language currentLanguage) {
    var slivers = <Widget>[];
    slivers.add(_buildCurrentLanguageHeader(context, currentLanguage));
    slivers.addAll(_buildHeaderBuilderLists(context));
    return slivers;
  }

  Widget _buildCurrentLanguageHeader(
      BuildContext context, Language currentLanguage) {
    return SliverStickyHeader.builder(
      builder: (context, state) => _buildAnimatedHeader(context, '当前语言', state),
      sliver: SliverList(
        delegate: SliverChildListDelegate(ListTile.divideTiles(
            context: context,
            tiles: _buildListTiles(context, [
              Language(
                text:
                    currentLanguage.text == StringUtil.empty ? '所有语言' : currentLanguage.text,
                color: currentLanguage.color,
              )
            ])).toList()),
      ),
    );
  }

  List<Widget> _buildHeaderBuilderLists(BuildContext context) {
    var keys = _getSortedKeys;
    var sliverStickyHeaders = <Widget>[];

    sliverStickyHeaders.addAll(List.generate(keys.length, (sliverIndex) {
      var key = keys[sliverIndex];
      var languages = languagesMap[key];

      return SliverStickyHeader.builder(
        builder: (context, state) => _buildAnimatedHeader(context, key, state),
        sliver: SliverList(
          delegate: SliverChildListDelegate(ListTile.divideTiles(
                  context: context, tiles: _buildListTiles(context, languages))
              .toList()),
        ),
      );
    }));
    return sliverStickyHeaders;
  }

  List<String> get _getSortedKeys => languagesMap.keys.toList()..sort();

  Widget get _getListKeys {
    const style = TextStyle(fontSize: 12, fontWeight: FontWeight.w500);
    const selectedStyle = TextStyle(
        fontSize: 12,
        color: Colors.lightBlueAccent,
        fontWeight: FontWeight.w500);
    var widgets = <Widget>[];
    _getSortedKeys.asMap().forEach((index, key) {
      widgets.add(GestureDetector(
        onTap: () => _onTapKey(index),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(2),
          height: keyItemHeight,
          width: 14,
          child: Text(
            key,
            style: currentKeyIndex == index ? selectedStyle : style,
          ),
        ),
      ));
    });

    return Column(
      children: widgets,
    );
  }

  Widget _buildAnimatedHeader(
      BuildContext context, String key, SliverStickyHeaderState state) {
    var _theme = Theme.of(context);

    return Container(
      height: sliverHeaderHeight,
      color: (state.isPinned
              ? _theme.colorScheme.primary
              : Colors.blueGrey.withOpacity(0.5))
          .withOpacity(1.0 - state.scrollPercentage),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      alignment: Alignment.centerLeft,
      child: Text(
        key,
      ),
    );
  }

  void _loadLanguages() {
    var resultMap = <String, List<dynamic>>{};
    for (var language in Languages.languages) {
      var text = language.text;
      if (text != null && text.isNotEmpty) {
        var langPrefix = text.substring(0, 1).toUpperCase();
        var languagesInMap =
            !resultMap.containsKey(langPrefix) ? [] : resultMap[langPrefix]!;
        languagesInMap.add(language);
        resultMap[langPrefix] = languagesInMap;
      }
    }

    if (resultMap.containsKey('A')) {
      var languagesInMap = resultMap['A']!;
      languagesInMap.insert(0, Language(text: '所有语言', color: '#cccccc'));
      resultMap['A'] = languagesInMap;
    }
    setState(() {
      languagesList = Languages.languages;
      languagesMap = resultMap;
    });
  }

  List<Widget> _buildListTiles(BuildContext context, List<dynamic>? languages) {
    var tiles = <Widget>[];
    if (languages != null && languages.isNotEmpty) {
      for (var language in languages) {
        tiles.add(GestureDetector(
          onTap: () {
            _selectLanguage(language);
            NavigatorUtil.pop(context);
          },
          child: Container(
            alignment: Alignment.centerLeft,
            height: sliverItemHeight,
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(right: 6),
                  child: PhysicalModel(
                    color: ColorUtil.color(language.color!),
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(6),
                    child: const SizedBox(
                      width: 12,
                      height: 12,
                      child: Text(StringUtil.empty),
                    ),
                  ),
                ),
                Expanded(child: Text('${language.text}'))
              ],
            ),
          ),
        ));
      }
    }
    return tiles;
  }

  void _clickSinceTab(int index) {
    if (widget.selectSince != null) {
      widget.selectSince!(index);
    }
  }

  void _selectLanguage(Language language) {
    if (widget.selectLanguage != null) {
      widget.selectLanguage!(language);
    }
  }

  void _loadCurrentSince() {
    if (widget.loadSince != null) {
      widget.loadSince!();
    }
  }

  void _loadCurrentLanguage() {
    if (widget.loadLanguage != null) {
      widget.loadLanguage!();
    }
  }

  void _onTapKey(int index) {
    setState(() {
      currentKeyIndex = index;
    });

    // 计算滚动offset
    var offset = sliverItemHeight + sliverHeaderHeight;
    _getSortedKeys.asMap().forEach((sortedIndex, sortedKey) {
      if (sortedIndex < index) {
        offset += languagesMap[sortedKey]!.length * sliverItemHeight +
            sliverHeaderHeight;
      }
    });
    _scrollController.jumpTo(offset + 0.01);
  }

  void _onScroll(double pixels) {
    if (pixels <= 0) return;
    var height = sliverItemHeight + sliverHeaderHeight;

    for (final key in _getSortedKeys) {
      height +=
          languagesMap[key]!.length * sliverItemHeight + sliverHeaderHeight;
      if (height >= pixels) {
        var index = _getSortedKeys.indexOf(key);
        if (index != currentKeyIndex) {
          setState(() {
            currentKeyIndex = index;
          });
        }
        break;
      }
    }
  }

  void _onInputSubmitted(String value) {
    var searchList = <Language>[];

    if (value.isNotEmpty) {
      for (var language in languagesList) {
        if (language.text!.toLowerCase().contains(value.toLowerCase())) {
          searchList.add(language);
        }
      }
    }

    if (value.isEmpty && _inputText.isEmpty) return;

    setState(() {
      _languagesBySearch = searchList;
      _inputText = value;
    });
  }

  void _onInputChanged(String value) {
    if (value.isEmpty) {
      _onInputSubmitted(value);
    }
  }

  @override
  bool get wantKeepAlive => true;
}
