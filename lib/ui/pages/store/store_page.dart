import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/flutter_boilerplate_localizations.dart';

class StorePage extends StatefulWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          FlutterBoilerplateLocalizations.of(context)!.tabStoreTitle,
        ),
      ),
      body: Center(
        child: Text(FlutterBoilerplateLocalizations.of(context)!.tabStoreTitle),
      ),
    );
  }
}
