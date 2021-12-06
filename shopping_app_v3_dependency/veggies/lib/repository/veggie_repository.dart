import 'package:shopping_app/feature/home/model/product.dart';
import 'package:shopping_app/repository/product_repository.dart';
import 'package:shopping_app/service/product_service/product_service.dart';

class VeggieProductRepository extends ProductRepository {
  VeggieProductRepository({required this.service});

  final ProductService service;

  @override
  Future<Product> getProduct({required int id}) => service.getProduct(id: id);

  @override
  Future<List<Product>> getProductsByIds({required List<int> ids}) =>
      service.getProducts(ids: ids);

  @override
  Future<List<Product>> getAllProducts() => service.getAllProducts();
}
