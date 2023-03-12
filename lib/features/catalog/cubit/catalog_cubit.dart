import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_catalog/core/source/local_data_source.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'catalog_state.dart';
part 'catalog_cubit.freezed.dart';

class CatalogCubit extends Cubit<CatalogState> {
  CatalogCubit(this._localDataSource) : super(const CatalogState.initial()) {
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
    Future.delayed(const Duration(seconds: 1), () {
      data = list;
      emit(CatalogState.loadaed(data: data, themeMode: themeMode));
    });
  }

  void changeThemeMode({required bool flag}) {
    _localDataSource.setIsDark(flag: flag);
    emit((state as Loaded).copyWith(themeMode: themeMode));
  }

  bool get themeMode => _localDataSource.isDark ?? false;
}
