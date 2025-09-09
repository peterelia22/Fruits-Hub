import 'package:bloc/bloc.dart';
import 'package:fruits_hub/features/home/domain/entites/cart_entity.dart';
import 'package:meta/meta.dart';

import '../../../../../core/entities/products_entity.dart';
import '../../../domain/entites/cart_item_entity.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  CartEntity cartEntity = CartEntity([]);

  void addToCart(ProductsEntity productEntity,
      {int quantity = 1, bool silent = false}) {
    final updatedCart = CartEntity(List.from(cartEntity.cartItems));

    bool isProductExist = updatedCart.isExist(productEntity);

    if (isProductExist) {
      var cartItem = updatedCart.getCartItem(productEntity);
      cartItem.quantity += quantity;
    } else {
      final newCartItem = CartItemEntity(
        productsEntity: productEntity,
        quantity: quantity,
      );
      updatedCart.addCartItem(newCartItem);
    }

    cartEntity = updatedCart;

    if (silent) {
      emit(CartUpdated());
    } else {
      emit(CartItemAdded());
    }
  }

  void deleteCartItem(CartItemEntity cartItemEntity) {
    final updatedCart = CartEntity(List.from(cartEntity.cartItems));
    updatedCart.deleteCartItem(cartItemEntity);

    cartEntity = updatedCart;

    emit(CartItemRemoved());
  }
}
