import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/source/local_data_source.dart';

part 'catalog_state.dart';

class CatalogCubit extends Cubit<CatalogState> {
  CatalogCubit(this._localDataSource) : super(CatalogInitial()) {
    getListOfWidgets();
  }
  final LocalDataSource _localDataSource;

  void getListOfWidgets() {
    var data = <String>[];
    final list = [
      'Buttons',
      'Text',
      'Loaders',
      'Layouts',
    ];
    Future.delayed(const Duration(seconds: 5), () {
      data = list;
      emit(CatalogLoaded(data: data));
    });
  }

  void changeThemeMode({required bool flag}) {
    _localDataSource.setIsDark(flag: flag);
    emit(CatalogLoaded(data: ["a", "s", "f"]));
  }

  bool get themeMode => _localDataSource.isDark ?? false;
}
