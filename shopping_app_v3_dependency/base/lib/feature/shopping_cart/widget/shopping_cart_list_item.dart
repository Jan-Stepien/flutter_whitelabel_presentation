import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/configuration/configuration.dart';
import 'package:shopping_app/feature/home/model/product.dart';

class ShoppingCartListItem extends StatelessWidget {
  const ShoppingCartListItem({Key? key, required this.product})
      : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final assetPath =
        'assets/${context.read<AppConfiguration>().assetsFolderName}/${product.assetImageFile}';
    return Row(
      children: [
        SizedBox(
          height: 50,
          child: AspectRatio(
            aspectRatio: 1,
            child: Image(
              image: AssetImage(assetPath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 20, height: 20),
        Expanded(child: Text(product.productName)),
        Expanded(
            child: Text(
          '\$ ${product.productPrice}',
          textAlign: TextAlign.end,
        )),
        const SizedBox(width: 20, height: 20),
      ],
    );
  }
}
