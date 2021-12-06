import 'package:flutter/material.dart';
import 'package:shopping_app/feature/home/model/product.dart';
import 'package:shopping_app/feature/product/product_page.dart';

class ShoppingProductWidget extends StatelessWidget {
  const ShoppingProductWidget({Key? key, required this.product})
      : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (_) => ProductPage(product: product))),
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            children: [
              SizedBox(
                height: 50,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset(
                    'assets/fruits/${product.assetImageFile}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(child: Text(product.productName)),
              IconButton(
                onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${product.productName} was added to cart'),
                  ),
                ),
                icon: const Icon(Icons.add_shopping_cart),
              ),
              const SizedBox(width: 20),
            ],
          ),
        ),
      ),
    );
  }
}
