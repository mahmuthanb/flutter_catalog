import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_catalog/core/res/theme.dart';
import 'package:flutter_catalog/core/router.dart';
import 'package:flutter_catalog/core/source/local_data_source.dart';
import 'package:flutter_catalog/features/app/cubit/app_cubit.dart';
import 'package:flutter_catalog/l10n/l10n.dart';
import 'package:get_storage/get_storage.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final getStorage = GetStorage();
    final localDataSource = LocalDataSourceImpl(getStorage);
    return BlocProvider(
      create: (_) => AppCubit(localDataSource),
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return MaterialApp(
          theme: AppThemeFlex.theme(),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          onGenerateRoute: onGenerateRoute,
          initialRoute: EasyRoutes.catalog,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
