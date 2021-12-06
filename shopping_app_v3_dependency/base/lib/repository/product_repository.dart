import 'dart:core';

import 'package:shopping_app/feature/home/model/product.dart';
import 'package:shopping_app/service/product_service/product_service.dart';

abstract class ProductRepository {
  Future<Product> getProduct({required int id});
  Future<List<Product>> getProductsByIds({required List<int> ids});
  Future<List<Product>> getAllProducts();
}

class SpecificProductRepository extends ProductRepository {
  SpecificProductRepository({required this.service});

  final ProductService service;

  @override
  Future<Product> getProduct({required int id}) => service.getProduct(id: id);

  @override
  Future<List<Product>> getProductsByIds({required List<int> ids}) =>
      service.getProducts(ids: ids);

  @override
  Future<List<Product>> getAllProducts() => service.getAllProducts();
}
