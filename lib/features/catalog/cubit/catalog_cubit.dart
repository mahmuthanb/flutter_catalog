import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'catalog_state.dart';

class CatalogCubit extends Cubit<CatalogState> {
  CatalogCubit() : super(CatalogInitial());

  List<String>? getListOfWidgets() {
    var data = <String>[];
    final list = ['Buttons', 'Text'];
    data = list;
    if (data.isNotEmpty) return data;
    return null;
  }
}
