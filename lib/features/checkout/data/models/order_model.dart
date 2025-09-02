import 'dart:math';

import 'package:fruits_hub/features/checkout/data/models/order_product_model.dart';
import 'package:fruits_hub/features/checkout/data/models/shipping_address_model.dart';
import 'package:fruits_hub/features/checkout/presentation/domain/entities/order_entity.dart';

class OrderModel {
  final double totalPrice;
  final String uID;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;

  OrderModel(
      {required this.totalPrice,
      required this.uID,
      required this.shippingAddressModel,
      required this.orderProducts,
      required this.paymentMethod});
  toJson() {
    return {
      'totalPrice': totalPrice,
      'uID': uID,
      'shippingAddress': shippingAddressModel.toJson(),
      'orderProducts': orderProducts.map((e) => e.toJson()).toList(),
      'paymentMethod': paymentMethod
    };
  }

  factory OrderModel.fromEntity(OrderEntity entity) {
    return OrderModel(
      totalPrice: entity.cartEntity.calculateTotalPrice(),
      uID: entity.uID,
      shippingAddressModel:
          ShippingAddressModel.fromEntity(entity.shippingAddress),
      orderProducts: entity.cartEntity.cartItems
          .map((e) => OrderProductModel.fromEntity(entity: e))
          .toList(),
      paymentMethod: entity.payWithCash! ? 'Cash' : 'Paypal',
    );
  }
}
