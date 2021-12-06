import 'package:shopping_app/feature/home/model/product.dart';

abstract class ProductService {
  Future<Product> getProduct({required int id});
  Future<List<Product>> getProducts({required List<int> ids});
  Future<List<Product>> getAllProducts();
}
