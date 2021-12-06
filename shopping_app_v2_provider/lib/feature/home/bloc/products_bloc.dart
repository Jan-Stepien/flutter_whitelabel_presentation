import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/feature/home/bloc/products_event.dart';
import 'package:shopping_app/feature/home/bloc/products_state.dart';

import 'package:shopping_app/repository/product_repository.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc({required this.productRepository}) : super(ProductsState()) {
    on<LoadProductsEvent>((event, emit) async {
      emit(ProductsLoading());
      final products = await productRepository.getAllProducts();
      emit(ProductsLoaded(products: products));
    });
  }

  final ProductRepository productRepository;
}
