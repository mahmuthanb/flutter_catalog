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
        builder: (context, state) => state.maybeWhen(
          initial: () => const Center(
            child: Text('loading'),
          ),
          orElse: () => const ErrorWidget(),
          loadaed: (data, themeMode) {
            return Scaffold(
              appBar: AppBar(
                title: Text(l10n.catalogAppBarTitle),
                actions: [
                  Switch(
                    value: themeMode ?? false,
                    onChanged: (value) => context
                        .read<CatalogCubit>()
                        .changeThemeMode(flag: value),
                  )
                ],
              ),
              body: data != null && data.isNotEmpty
                  ? ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) => Card(
                        elevation: 1,
                        child: Text(data[index]),
                      ),
                    )
                  : Container(),
            );
          },
        ),
      ),
    );
  }
}

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Failed to load data'),
    );
  }
}
