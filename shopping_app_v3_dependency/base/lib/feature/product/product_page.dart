import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/configuration/configuration.dart';
import 'package:shopping_app/feature/home/model/product.dart';
import 'package:shopping_app/feature/shopping_cart/bloc/shopping_cart_bloc.dart';
import 'package:shopping_app/feature/shopping_cart/bloc/shopping_cart_event.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key, required this.product}) : super(key: key);

  final Product product;
  @override
  Widget build(BuildContext context) {
    final assetPath =
        'assets/${context.read<AppConfiguration>().assetsFolderName}/${product.assetImageFile}';
    return Scaffold(
      appBar: AppBar(),
      backgroundColor:
          context.read<AppConfiguration>().homeDetail.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints.expand(height: 300),
            child: Hero(
              tag: assetPath,
              child: Image.asset(
                assetPath,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Text(
            product.productName,
            style: Theme.of(context).textTheme.headline4,
          ),
          Text(
            '\$ ${product.productPrice}',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          ElevatedButton(
              child: const Text('Add to cart'),
              onPressed: () {
                context
                    .read<ShoppingCartBloc>()
                    .add(ShoppingCartProductAdd(product: product));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${product.productName} was added to cart'),
                    duration: const Duration(seconds: 1),
                  ),
                );
              })
        ],
      ),
    );
  }
}
