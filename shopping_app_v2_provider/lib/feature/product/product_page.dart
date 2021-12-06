import 'package:flutter/material.dart';
import 'package:shopping_app/feature/home/model/product.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key, required this.product}) : super(key: key);

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Image.asset('assets/fruits/${product.assetImageFile}'),
          Text(product.productName),
        ],
      ),
    );
  }
}
