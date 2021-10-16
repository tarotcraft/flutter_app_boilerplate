import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/gitter_localizations.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          GitterLocalizations.of(context)!.tabNewsTitle,
        ),
      ),
      body: Center(
        child: Text(GitterLocalizations.of(context)!.tabNewsTitle),
      ),
    );
  }
}
