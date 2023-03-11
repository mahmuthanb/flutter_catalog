import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/res/theme.dart';
import 'package:flutter_catalog/core/router.dart';
import 'package:flutter_catalog/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateRoute: onGenerateRoute,
      initialRoute: EasyRoutes.catalog,
    );
  }
}
