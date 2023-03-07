// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:flutter_catalog/core/config.dart' as _i4;
import 'package:flutter_catalog/core/di/module.dart' as _i8;
import 'package:flutter_catalog/data/service/api_service.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:get_storage/get_storage.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;
import 'package:package_info_plus/package_info_plus.dart' as _i7;

const String _prod = 'prod';
const String _dev = 'dev';
const String _test = 'test';

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.lazySingleton<_i3.ApiService>(() => appModule.injectApiService);
    gh.lazySingleton<_i4.AppConfig>(
      () => _i4.ProdAppConfigImpl(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i4.AppConfig>(
      () => _i4.TestAppConfigImpl(),
      registerFor: {_test},
    );
    gh.lazySingleton<_i4.AppConfig>(
      () => _i4.DevAppConfigImpl(),
      registerFor: {_dev},
    );
    gh.factory<_i5.Dio>(() => appModule.injectRetrofitAPI);
    await gh.factoryAsync<_i6.GetStorage>(
      () => appModule.storage,
      registerFor: {
        _prod,
        _dev,
      },
      preResolve: true,
    );
    await gh.factoryAsync<_i7.PackageInfo>(
      () => appModule.packageInfo,
      registerFor: {
        _prod,
        _dev,
      },
      preResolve: true,
    );
    return this;
  }
}

class _$AppModule extends _i8.AppModule {}
