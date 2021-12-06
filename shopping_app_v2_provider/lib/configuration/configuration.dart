import 'package:flutter/material.dart';

abstract class AppConfiguration {
  final String appTitle;
  final String assetsFolderName;
  final ThemeData themeData;
  final DatabaseConfiguration database;
  final HomePageConfiguration home;
  final HomeDetailPageConfiguration homeDetail;

  AppConfiguration({
    required this.appTitle,
    required this.assetsFolderName,
    required this.themeData,
    required this.database,
    required this.home,
    required this.homeDetail,
  });
}

class DatabaseConfiguration {
  String name;
  DatabaseType type;

  DatabaseConfiguration({required this.name, required this.type});
}

class HomePageConfiguration {
  final int productInRow;
  final EdgeInsets rowPadding;
  final EdgeInsets columnPadding;
  final double productAspectRatio;
  final ProductOrientation contentOrientation;

  HomePageConfiguration({
    required this.productInRow,
    required this.rowPadding,
    required this.columnPadding,
    this.productAspectRatio = 1,
    this.contentOrientation = ProductOrientation.horizontal,
  });
}

class HomeDetailPageConfiguration {
  final Color backgroundColor;

  HomeDetailPageConfiguration({required this.backgroundColor});
}

enum ProductOrientation { horizontal, vertical }

enum DatabaseType { file, restApi }
