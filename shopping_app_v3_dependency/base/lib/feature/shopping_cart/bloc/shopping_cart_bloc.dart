import 'package:bloc/bloc.dart';
import 'package:shopping_app/feature/shopping_cart/bloc/shopping_cart_event.dart';
import 'package:shopping_app/feature/shopping_cart/bloc/shopping_cart_state.dart';

class ShoppingCartBloc extends Bloc<ShoppingCartEvent, ShoppingCartState> {
  ShoppingCartBloc() : super(const ShoppingCartState(shoppingList: [])) {
    on<ShoppingCartProductAdd>((event, emit) {
      emit(ShoppingCartState(
          shoppingList: [...state.shoppingList, event.product]));
      print(state.shoppingList);
    });
  }
}
