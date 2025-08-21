import 'package:fruits_hub/features/checkout/presentation/domain/entities/shipping_address_entity.dart';
import 'package:fruits_hub/features/home/domain/entites/cart_item_entity.dart';

class OrderEntity {
  final List<CartItemEntity> cartItems;
  final bool payWithCash;
  final ShippingAddressEntity shippingAddress;
  OrderEntity(this.cartItems, this.payWithCash, this.shippingAddress);
}
