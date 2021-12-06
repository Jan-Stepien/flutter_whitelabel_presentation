import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/configuration/configuration.dart';
import 'package:shopping_app/configuration/fruits_configuration.dart';
import 'package:shopping_app/main_app.dart';

void main() {
  runApp(
    Provider<AppConfiguration>(
      create: (_) => FruitsAppConfiguration(),
      child: const MyApp(),
    ),
  );
}
