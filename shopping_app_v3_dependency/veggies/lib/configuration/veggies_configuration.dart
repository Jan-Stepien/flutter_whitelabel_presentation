import 'package:flutter/material.dart';
import 'package:shopping_app/configuration/configuration.dart';

class VeggiesAppConfiguration implements AppConfiguration {
  @override
  String get appTitle => 'Veggies app';

  @override
  String get assetsFolderName => 'veggies';

  @override
  DatabaseConfiguration get database => DatabaseConfiguration(
        name: 'veggies_database.json',
        type: DatabaseType.file,
      );

  @override
  HomePageConfiguration get home => HomePageConfiguration(
      columnPadding: const EdgeInsets.all(5),
      productInRow: 2,
      rowPadding: const EdgeInsets.all(5),
      contentOrientation: ProductOrientation.vertical,
      productAspectRatio: 1 / 1.1);

  @override
  HomeDetailPageConfiguration get homeDetail =>
      HomeDetailPageConfiguration(backgroundColor: Colors.lightGreen);

  @override
  ThemeData get themeData => ThemeData.light();
}
