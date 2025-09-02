import '../../../../core/entities/products_entity.dart';
import 'cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItems;

  CartEntity(this.cartItems);
  addCartItem(CartItemEntity cartItemEntity) => cartItems.add(cartItemEntity);
  deleteCartItem(CartItemEntity cartItemEntity) {
    cartItems.remove(cartItemEntity);
  }

  double calculateTotalPrice() {
    double totalPrice = 0;
    for (var item in cartItems) {
      totalPrice += item.calculateTotalPrice();
    }
    return totalPrice;
  }

  bool isExist(ProductsEntity product) {
    for (var item in cartItems) {
      if (item.productsEntity == product) {
        return true;
      }
    }
    return false;
  }

  CartItemEntity getCartItem(ProductsEntity product) {
    for (var item in cartItems) {
      if (item.productsEntity == product) {
        return item;
      }
    }
    return CartItemEntity(productsEntity: product, quantity: 1);
  }
}
