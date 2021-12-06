import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/configuration/configuration.dart';
import 'package:shopping_app/feature/home/bloc/products_bloc.dart';
import 'package:shopping_app/feature/home/bloc/products_state.dart';
import 'package:shopping_app/feature/home/widget/shopping_product_widget.dart';
import 'package:shopping_app/feature/shopping_cart/widget/shopping_cart_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.read<AppConfiguration>().appTitle),
        actions: [
          IconButton(
              onPressed: () => Navigator.push(context,
          MaterialPageRoute(builder: (_) => const ShoppingCartPage())),
              icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoaded) {
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: MediaQuery.of(context).size.width /
                        context.read<AppConfiguration>().home.productInRow,
                    childAspectRatio: context
                        .read<AppConfiguration>()
                        .home
                        .productAspectRatio,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5),
                itemCount: state.products.length,
                itemBuilder: (BuildContext ctx, index) {
                  return ShoppingProductWidget(
                    key: UniqueKey(),
                    product: state.products[index],
                    orientation: context.read<AppConfiguration>().home.contentOrientation,
                  );
                });
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
