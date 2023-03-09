import 'package:get_storage/get_storage.dart';
import 'package:injectable/injectable.dart';

abstract class LocalDataSource {
  bool get isDark;
  Future<dynamic> setIsDark({bool flag});
  Future<void> clear();
}

@Environment(Environment.prod)
@Environment(Environment.dev)
@LazySingleton(as: LocalDataSource)
class LocalDataSourceImpl implements LocalDataSource {
  LocalDataSourceImpl(this._getStorage);
  final GetStorage _getStorage;

  @override
  Future<void> clear() {
    return _getStorage.erase();
  }

  @override
  bool get isDark => (_getStorage.read('isDark') as bool) == true;

  @override
  Future<dynamic> setIsDark({bool? flag}) {
    return _getStorage.write('isDark', flag);
  }
}

@Environment(Environment.test)
@LazySingleton(as: LocalDataSource)
class TestLocalDataSource implements LocalDataSource {
  @override
  Future<void> clear() async {
    return;
  }

  bool _isDark = false;
  @override
  bool get isDark => _isDark;

  @override
  Future<dynamic> setIsDark({bool? flag}) async {
    _isDark = flag ?? false;
  }
}
