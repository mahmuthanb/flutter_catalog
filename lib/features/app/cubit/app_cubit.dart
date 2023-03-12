import 'package:bloc/bloc.dart';
import 'package:flutter_catalog/core/source/local_data_source.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.dart';
part 'app_cubit.freezed.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit(this._localDataSource) : super(const AppState.initial(true));
  final LocalDataSource _localDataSource;

  bool get theme => _localDataSource.isDark ?? false;
}
