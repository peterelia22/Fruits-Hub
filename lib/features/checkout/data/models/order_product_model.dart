import 'dart:math';

import '../../../home/domain/entites/cart_item_entity.dart';

class OrderProductModel {
  final String name;
  final String code;
  final String imageUrl;
  final double price;
  final int quantity;

  OrderProductModel(
      {required this.name,
      required this.code,
      required this.imageUrl,
      required this.price,
      required this.quantity});
  factory OrderProductModel.fromEntity({required CartItemEntity entity}) {
    return OrderProductModel(
        name: entity.productsEntity.name,
        code: entity.productsEntity.code,
        imageUrl: entity.productsEntity.imageUrl!,
        price: entity.productsEntity.price.toDouble(),
        quantity: entity.quantity);
  }
  toJson() {
    return {
      'name': name,
      'code': code,
      'imageUrl': imageUrl,
      'price': price,
      'quantity': quantity
    };
  }
}
