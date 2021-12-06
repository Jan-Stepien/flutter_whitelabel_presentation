import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:shopping_app/feature/home/model/product.dart';

abstract class ProductService {
  Future<Product> getProduct({required int id});

  Future<List<Product>> getProducts({required List<int> ids});

  Future<List<Product>> getAllProducts();
}

class SpecificProductService extends ProductService {
  SpecificProductService();

  Future<List<Product>> _readProducts() async {
    final String database =
        await rootBundle.loadString('database/fruits_database.json');
    Map<String, dynamic> listOfMaps = jsonDecode(database);

    List<dynamic> list = listOfMaps['products'];

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
