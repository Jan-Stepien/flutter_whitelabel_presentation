import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/feature/shopping_cart/bloc/shopping_cart_bloc.dart';
import 'package:shopping_app/feature/shopping_cart/bloc/shopping_cart_state.dart';
import 'package:shopping_app/feature/shopping_cart/widget/shopping_cart_list_item.dart';

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: BlocBuilder<ShoppingCartBloc, ShoppingCartState>(
          builder: (context, state) {
            if (state.shoppingList.isEmpty) {
              return Column(
                children: const [Text('No products in shopping cart')],
              );
            } else {
              return ListView.builder(
                  itemCount: state.shoppingList.length,
                  itemBuilder: (BuildContext context, index) {
                    return ShoppingCartListItem(
                      product: state.shoppingList[index],
                    );
                  });
            }
          },
        ),
      ),
    );
  }
}
