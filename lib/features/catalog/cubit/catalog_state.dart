part of 'catalog_cubit.dart';

@freezed
class CatalogState with _$CatalogState {
  const factory CatalogState.initial() = Initial;
  const factory CatalogState.loadaed({List<String>? data, bool? themeMode}) =
      Loaded;
}
