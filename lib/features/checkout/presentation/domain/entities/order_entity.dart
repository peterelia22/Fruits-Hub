import 'package:fruits_hub/features/checkout/presentation/domain/entities/shipping_address_entity.dart';
import 'package:fruits_hub/features/home/domain/entites/cart_entity.dart';
import 'package:fruits_hub/features/home/domain/entites/cart_item_entity.dart';

class OrderEntity {
  final CartEntity cartEntity;
  bool? payWithCash;
  ShippingAddressEntity? shippingAddress = ShippingAddressEntity();
  OrderEntity(this.cartEntity, {this.payWithCash});
}
