import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/gitter_localizations.dart';

class StarsPage extends StatefulWidget {
  const StarsPage({Key? key}) : super(key: key);

  @override
  _StarsPageState createState() => _StarsPageState();
}

class _StarsPageState extends State<StarsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          GitterLocalizations.of(context)!.tabStarsTitle,
        ),
      ),
      body: Center(
        child: Text(GitterLocalizations.of(context)!.tabStarsTitle),
      ),
    );
  }
}
