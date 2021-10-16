import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/gitter_localizations.dart';

class NoData extends StatelessWidget {
  const NoData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        GitterLocalizations.of(context)!.noData,
      ),
    );
  }
}
