import 'package:bloc/bloc.dart';
import 'package:fruits_hub/features/home/domain/entites/cart_entity.dart';
import 'package:meta/meta.dart';

import '../../../../../core/entities/products_entity.dart';
import '../../../domain/entites/cart_item_entity.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  CartEntity cartEntity = CartEntity([]);
  void addToCart(ProductsEntity productEntity) {
    bool isProductExist = cartEntity.isExist(productEntity);
    var cartItem = cartEntity.getCartItem(productEntity);
    if (isProductExist) {
      cartItem.increaseCount();
    } else {
      cartEntity.addCartItem(cartItem);
    }
    emit(CartProductAdded());
  }
}
