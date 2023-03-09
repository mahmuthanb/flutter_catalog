// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// EasyRouteConfigGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter_catalog/features/counter/counter.dart';

// extension RouteSettingsEx on RouteSettings {
//   T routeArgs<T>() => arguments as T;
// }

// extension BuildContextEx on BuildContext {
//   NavigatorState navigator() => Navigator.of(this);
//   NavigatorState rootNavigator() => Navigator.of(this, rootNavigator: true);
//   T routeArgs<T>() => ModalRoute.of(this)?.settings.arguments as T;
// }

class RouteModel {
  RouteModel(
    this.builder, {
    this.fullscreenDialog = false,
  });
  WidgetBuilder builder;
  bool fullscreenDialog;
}

class EasyRoutes {
  static String splash = 'splash';
  static String login = 'login';
  static String root = '/';
  static String widgetCatalog = '/widget_catalog';
  static String counter = '/counter';
}

final Map<String, RouteModel> _routes = {
  EasyRoutes.counter: RouteModel(
    (_) => const CounterPage(),
  ),
};
Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
  final route = _routes[routeSettings.name];
  if (route == null) {
    return null;
  }
  return MaterialPageRoute(
    builder: route.builder,
    settings: routeSettings,
    fullscreenDialog: route.fullscreenDialog,
  );
}
