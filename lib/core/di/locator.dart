import 'package:flutter_catalog/core/di/locator.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

GetIt getIt = GetIt.instance;
@InjectableInit()
Future<GetIt> setupDI(String environment) =>
    getIt.init(environment: environment);
