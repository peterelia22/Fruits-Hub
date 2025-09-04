import 'package:fruits_hub/features/home/domain/entites/cart_item_entity.dart';

class PaymobItem {
  String? name;
  double? amount;
  String? description;
  int? quantity;
  String? image;

  PaymobItem({
    this.name,
    this.amount,
    this.description,
    this.quantity,
    this.image,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'amount': amount,
        'description': description,
        'quantity': quantity,
        'image': image,
      };

  factory PaymobItem.fromEntity(CartItemEntity entity) {
    return PaymobItem(
      name: entity.productsEntity.name,
      amount: entity.productsEntity.price.toDouble() * 100,
      description: entity.productsEntity.description ?? 'منتج من متجر الفواكه',
      quantity: entity.quantity,
      image: entity.productsEntity.imageUrl,
    );
  }
}
