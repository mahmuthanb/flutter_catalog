import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'catalog_state.dart';

class CatalogCubit extends Cubit<CatalogState> {
  CatalogCubit() : super(CatalogInitial());
}
