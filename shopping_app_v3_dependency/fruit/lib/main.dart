import 'package:flutter/material.dart';
import 'package:fruit/configuration/fruits_configuration.dart';
import 'package:fruit/repository/fruit_repository.dart';
import 'package:fruit/service/fruit_service.dart';
import 'package:shopping_app/configuration/configuration.dart';
import 'package:shopping_app/main_app.dart';

void main() {
  final configuration = FruitsAppConfiguration();
  runApp(
    MyApp(
      productRepository: FruitProductRepository(
        service: FruitProductService(
          databaseSource: DatabaseConfiguration(
            name: configuration.database.name,
            type: configuration.database.type,
          ),
        ),
      ),
      appConfiguration: configuration,
    ),
  );
}
