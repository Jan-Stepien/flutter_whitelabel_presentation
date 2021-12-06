import 'package:equatable/equatable.dart';
import 'package:shopping_app/feature/home/model/product.dart';

class ShoppingCartState extends Equatable {
  final List<Product> shoppingList;

  const ShoppingCartState({required this.shoppingList});

  @override
  List<Object> get props => [shoppingList];
}
