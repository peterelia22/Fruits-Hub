import 'package:equatable/equatable.dart';
import 'package:fruits_hub/core/entities/products_entity.dart';

class CartItemEntity extends Equatable {
  final ProductsEntity productsEntity;
  int quantity;

  CartItemEntity({required this.productsEntity, this.quantity = 0});
  num calculateTotalPrice() {
    return productsEntity.price * quantity;
  }

  num calculateTotalWeight() {
    return productsEntity.gramAmount * quantity;
  }

  increaseCount() {
    quantity++;
  }

  decreaseCount() {
    if (quantity > 0) {
      quantity--;
    }
  }

  @override
  // TODO: implement props
  List<Object?> get props => [productsEntity];
}
