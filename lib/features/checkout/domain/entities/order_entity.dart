import 'package:fruits_hub/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:fruits_hub/features/home/domain/entites/cart_entity.dart';
import 'package:fruits_hub/features/home/domain/entites/cart_item_entity.dart';

class OrderEntity {
  final String uID;
  final CartEntity cartEntity;
  bool? payWithCash;
  ShippingAddressEntity shippingAddress;
  OrderEntity(this.cartEntity,
      {this.payWithCash, required this.shippingAddress, required this.uID});
  double calculateShippingCost() {
    if (payWithCash!) {
      return 30;
    } else {
      return 0;
    }
  }

  double calculateShippingDiscount() {
    return 0;
  }

  calcualteTotalOrderPriceAfterDiscountAndShipping() {
    return cartEntity.calculateTotalPrice() +
        calculateShippingCost() -
        calculateShippingDiscount();
  }
}
