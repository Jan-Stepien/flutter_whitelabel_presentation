import 'package:shopping_app/feature/home/model/product.dart';

class ShoppingCartEvent {}

class ShoppingCartProductAdd extends ShoppingCartEvent {
  ShoppingCartProductAdd({required this.product});
  final Product product;
}
