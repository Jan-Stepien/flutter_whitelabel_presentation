import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/feature/home/bloc/products_bloc.dart';
import 'package:shopping_app/feature/home/bloc/products_event.dart';
import 'package:shopping_app/feature/home/home_page.dart';
import 'package:shopping_app/feature/shopping_cart/bloc/shopping_cart_bloc.dart';
import 'package:shopping_app/repository/product_repository.dart';
import 'package:shopping_app/service/product_service.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ProductRepository>(
          create: (_) => SpecificProductRepository(
            service: SpecificProductService(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MultiBlocProvider(providers: [
          BlocProvider<ShoppingCartBloc>(
            create: (_) => ShoppingCartBloc(),
          ),
          BlocProvider<ProductsBloc>(
            create: (context) => ProductsBloc(
                productRepository: context.read<ProductRepository>())
              ..add(LoadProductsEvent()),
          ),
        ], child: const HomePage()),
      ),
    );
  }
}
