import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/configuration/configuration.dart';
import 'package:shopping_app/main_app.dart';
import 'package:veggies/configuration/veggies_configuration.dart';
import 'package:veggies/repository/veggie_repository.dart';
import 'package:veggies/service/veggie_service.dart';

void main() {
  runApp(
    Provider<AppConfiguration>(
      create: (_) => VeggiesAppConfiguration(),
      child: Builder(
        builder: (context) => MyApp(
          productRepository: VeggieProductRepository(
            service: VeggieProductService(
              databaseSource: DatabaseConfiguration(
                name: context.read<AppConfiguration>().database.name,
                type: context.read<AppConfiguration>().database.type,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
