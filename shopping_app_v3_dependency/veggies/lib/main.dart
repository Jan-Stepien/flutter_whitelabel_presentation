import 'package:flutter/material.dart';
import 'package:shopping_app/configuration/configuration.dart';
import 'package:shopping_app/main_app.dart';
import 'package:veggies/configuration/veggies_configuration.dart';
import 'package:veggies/repository/veggie_repository.dart';
import 'package:veggies/service/veggie_service.dart';

void main() {
  final configuration = VeggiesAppConfiguration();
  runApp(
    MyApp(
      productRepository: VeggieProductRepository(
        service: VeggieProductService(
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
