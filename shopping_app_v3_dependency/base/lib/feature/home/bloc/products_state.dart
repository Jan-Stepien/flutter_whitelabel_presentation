import 'package:equatable/equatable.dart';
import 'package:shopping_app/feature/home/model/product.dart';

class ProductsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<Product> products;

  ProductsLoaded({required this.products});
}
