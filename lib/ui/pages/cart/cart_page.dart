import 'package:flutter/material.dart';
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
      body: Center(
        child: Text(FlutterBoilerplateLocalizations.of(context)!.tabCartTitle),
      ),
    );
  }
}
