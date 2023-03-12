import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_catalog/core/source/local_data_source.dart';
import 'package:flutter_catalog/features/catalog/cubit/catalog_cubit.dart';
import 'package:flutter_catalog/l10n/l10n.dart';
import 'package:get_storage/get_storage.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    final getStorage = GetStorage();
    final localDataSource = LocalDataSourceImpl(getStorage);
    return BlocProvider(
      create: (_) => CatalogCubit(localDataSource),
      child: const CatalogView(),
    );
  }
}

class CatalogView extends StatelessWidget {
  const CatalogView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: BlocBuilder<CatalogCubit, CatalogState>(
        builder: (context, state) {
          if (state is CatalogLoaded) {
            return Scaffold(
              appBar: AppBar(
                title: Text(l10n.catalogAppBarTitle),
                actions: [
                  Switch(
                    value: context.read<CatalogCubit>().themeMode,
                    onChanged: (value) => context
                        .read<CatalogCubit>()
                        .changeThemeMode(flag: value),
                  )
                ],
              ),
              body: ListView.builder(
                itemCount: state.data?.length,
                itemBuilder: (context, index) => Card(
                  elevation: 1,
                  child: Text(state.data![index]),
                ),
              ),
            );
          } else {
            return const Center(
              child: Text('Loading'),
            );
          }
        },
      ),
    );
  }
}
