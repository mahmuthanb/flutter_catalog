// Package imports:
import 'package:injectable/injectable.dart';

abstract class AppConfig {
  String get baseUrl;
  String get name;
}

@Environment(Environment.prod)
@LazySingleton(as: AppConfig)
class ProdAppConfigImpl extends AppConfig {
  @override
  String get baseUrl => 'https://www.demourl.com';
  @override
  String get name => 'Flutter Catalog Prod';
}

@Environment(Environment.test)
@LazySingleton(as: AppConfig)
class TestAppConfigImpl extends AppConfig {
  @override
  String get baseUrl => 'https://test.demourl.copm';

  @override
  String get name => 'Flutter Catalog Test';
}

@Environment(Environment.dev)
@LazySingleton(as: AppConfig)
class DevAppConfigImpl extends AppConfig {
  @override
  String get baseUrl => 'https://dev.demourl.copm';

  @override
  String get name => 'Flutter Catalog Dev';
}
