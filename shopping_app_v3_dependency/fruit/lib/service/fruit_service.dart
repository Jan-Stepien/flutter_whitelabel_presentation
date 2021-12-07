import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:shopping_app/configuration/configuration.dart';
import 'package:shopping_app/feature/home/model/product.dart';
import 'package:shopping_app/service/product_service.dart';

class FruitProductService extends ProductService {
  FruitProductService({required this.databaseSource});
  DatabaseConfiguration databaseSource;

  Future<List<Product>> _readProducts() async {
    List<dynamic> list = [];

    if (databaseSource.type == DatabaseType.file) {
      final String database =
          await rootBundle.loadString('database/${databaseSource.name}');
      Map<String, dynamic> listOfMaps = jsonDecode(database);

      list = listOfMaps['products'];
    } else if (databaseSource.type == DatabaseType.restApi) {
      // Get product list from api
    }

    List<Product> result = [];
    for (final item in list) {
      result.add(Product.fromJson(item));
    }
    return result;
  }

  @override
  Future<Product> getProduct({required int id}) async {
    final result = await _readProducts();
    return result.firstWhere((element) => element.id == id);
  }

  @override
  Future<List<Product>> getProducts({required List<int> ids}) async {
    final result = await _readProducts();
    return result.where((element) => ids.contains(element.id)).toList();
  }

  @override
  Future<List<Product>> getAllProducts() async {
    final result = await _readProducts();
    return result;
  }
}
