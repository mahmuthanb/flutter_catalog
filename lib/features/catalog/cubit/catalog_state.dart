part of 'catalog_cubit.dart';

@immutable
abstract class CatalogState {}

class CatalogInitial extends CatalogState {}

class CatalogLoaded extends CatalogState {
  CatalogLoaded({this.data});
  final List<String>? data;
}
