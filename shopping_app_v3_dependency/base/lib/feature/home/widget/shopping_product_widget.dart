import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/configuration/configuration.dart';
import 'package:shopping_app/feature/home/model/product.dart';
import 'package:shopping_app/feature/product/product_page.dart';
import 'package:shopping_app/feature/shopping_cart/bloc/shopping_cart_bloc.dart';
import 'package:shopping_app/feature/shopping_cart/bloc/shopping_cart_event.dart';

class ShoppingProductWidget extends StatelessWidget {
  const ShoppingProductWidget({
    Key? key,
    required this.product,
    this.orientation = ProductOrientation.horizontal,
  }) : super(key: key);
  final Product product;
  final ProductOrientation? orientation;

  @override
  Widget build(BuildContext context) {
    final assetPath =
        'assets/${context.read<AppConfiguration>().assetsFolderName}/${product.assetImageFile}';

    return GestureDetector(
      key: key,
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (_) => ProductPage(product: product))),
      child: AspectRatio(
        aspectRatio: 1,
        child: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: orientation == ProductOrientation.horizontal
                ? Row(
                    children: getCardContent(context, assetPath),
                  )
                : Column(
                    children: getCardContent(context, assetPath),
                  ),
          ),
        ),
      ),
    );
  }

  List<Widget> getCardContent(BuildContext context, assetPath) {
    return [
      SizedBox(
        height: 50,
        child: AspectRatio(
          aspectRatio: 1,
          child: Hero(
            tag: assetPath,
            child: Image(
              image: AssetImage(assetPath),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      const SizedBox(width: 20, height: 20),
      Expanded(child: Text(product.productName)),
      Expanded(child: Text('\$ ${product.productPrice}')),
      FittedBox(
        child: IconButton(
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
          },
          icon: const Icon(Icons.add_shopping_cart),
        ),
      ),
      const SizedBox(width: 20, height: 20),
    ];
  }
}
