import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/configuration/configuration.dart';
import 'package:shopping_app/feature/home/bloc/products_bloc.dart';
import 'package:shopping_app/feature/home/bloc/products_event.dart';
import 'package:shopping_app/feature/home/home_page.dart';
import 'package:shopping_app/feature/shopping_cart/bloc/shopping_cart_bloc.dart';
import 'package:shopping_app/repository/product_repository.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.productRepository,
    required this.appConfiguration,
  }) : super(key: key);

  final ProductRepository productRepository;
  final AppConfiguration appConfiguration;

  @override
  Widget build(BuildContext context) {
    return Provider<AppConfiguration>(
      create: (_) => appConfiguration,
      child: Builder(
        builder: (context) => MultiRepositoryProvider(
          providers: [
            RepositoryProvider<ProductRepository>(
                create: (context) => productRepository)
          ],
          child: MultiBlocProvider(
            providers: [
              BlocProvider<ShoppingCartBloc>(
                create: (_) => ShoppingCartBloc(),
              ),
              BlocProvider<ProductsBloc>(
                create: (context) => ProductsBloc(
                    productRepository: context.read<ProductRepository>())
                  ..add(
                    LoadProductsEvent(),
                  ),
              ),
            ],
            child: MaterialApp(
              title: context.read<AppConfiguration>().appTitle,
              theme: context.read<AppConfiguration>().themeData,
              home: const HomePage(),
            ),
          ),
        ),
      ),
    );
  }
}
