// Flutter imports:
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_catalog/core/config.dart';
import 'package:flutter_catalog/core/di/locator.dart';
import 'package:flutter_catalog/data/service/api_service.dart';
import 'package:get_storage/get_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class AppModule {
  Dio get injectRetrofitAPI {
    final dio = Dio(
      BaseOptions(
        baseUrl: getIt<AppConfig>().baseUrl,
        connectTimeout: const Duration(milliseconds: 100000),
        receiveTimeout: const Duration(milliseconds: 100000),
        sendTimeout: const Duration(milliseconds: 100000),
      ),
    );
    // If you have an expiring Token, you can add your custom TokenInterceptor.
    // dio.interceptors.add(TokenInterceptor());
    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
        ),
      );
    }
    return dio;
  }

  @Environment(Environment.prod)
  @Environment(Environment.dev)
  @preResolve
  Future<GetStorage> get storage async {
    await GetStorage.init();
    return GetStorage();
  }

  @lazySingleton
  ApiService get injectApiService => ApiService(injectRetrofitAPI);

  @Environment(Environment.prod)
  @Environment(Environment.dev)
  @preResolve
  Future<PackageInfo> get packageInfo => PackageInfo.fromPlatform();
}
