import 'package:fruits_hub/core/entities/products_entity.dart';

class CartItemEntity {
  final ProductsEntity productsEntity;
  int count;

  CartItemEntity({required this.productsEntity, this.count = 0});
}
