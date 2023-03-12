import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/source/local_data_source.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit(this._localDataSource) : super(AppInitial());
  final LocalDataSource _localDataSource;

  bool get themeMode => _localDataSource.isDark ?? false;
}
