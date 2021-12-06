import 'dart:core';
import 'package:shopping_app/feature/home/model/product.dart';

abstract class ProductRepository {
  Future<Product> getProduct({required int id});
  Future<List<Product>> getProductsByIds({required List<int> ids});
  Future<List<Product>> getAllProducts();
}
