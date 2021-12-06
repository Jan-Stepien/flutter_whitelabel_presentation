import 'package:flutter/material.dart';
import 'package:shopping_app/configuration/configuration.dart';

class FruitsAppConfiguration implements AppConfiguration {
  @override
  String get appTitle => 'Fruits app';

  @override
  String get assetsFolderName => 'fruits';

  @override
  DatabaseConfiguration get database => DatabaseConfiguration(
      name: 'fruits_database.json', type: DatabaseType.file);

  @override
  HomePageConfiguration get home => HomePageConfiguration(
        columnPadding: const EdgeInsets.all(10),
        productInRow: 1,
        productAspectRatio: 5,
        rowPadding: const EdgeInsets.all(10),
      );

  @override
  HomeDetailPageConfiguration get homeDetail =>
      HomeDetailPageConfiguration(backgroundColor: Colors.amber);

  @override
  ThemeData get themeData => ThemeData.dark();
}
