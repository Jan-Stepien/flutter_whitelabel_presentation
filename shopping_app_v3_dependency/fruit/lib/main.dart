import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit/configuration/fruits_configuration.dart';
import 'package:fruit/repository/fruit_repository.dart';
import 'package:fruit/service/fruit_service.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/configuration/configuration.dart';
import 'package:shopping_app/main_app.dart';

void main() {
  runApp(
    Provider<AppConfiguration>(
      create: (_) => FruitsAppConfiguration(),
      child: Builder(
        builder: (context) => MyApp(
          productRepository: FruitProductRepository(
            service: FruitProductService(
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
