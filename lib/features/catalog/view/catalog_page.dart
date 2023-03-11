import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_catalog/features/catalog/cubit/catalog_cubit.dart';
import 'package:flutter_catalog/l10n/l10n.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CatalogCubit(),
      child: const CatalogView(),
    );
  }
}

class CatalogView extends StatelessWidget {
  const CatalogView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final data = context.read<CatalogCubit>().getListOfWidgets();
    return Scaffold(
      appBar: AppBar(title: Text(l10n.catalogAppBarTitle)),
      body: ListView.builder(
        itemCount: data?.length,
        itemBuilder: (context, index) => Text(data![index]),
      ),
    );
  }
}
