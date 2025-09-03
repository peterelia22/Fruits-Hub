import 'package:fruits_hub/core/helper_functions/get_currency.dart';
import 'package:fruits_hub/features/home/domain/entites/cart_item_entity.dart';

class Item {
  String? name;
  int? quantity;
  String? price;
  String? currency;

  Item({this.name, this.quantity, this.price, this.currency});

  Map<String, dynamic> toJson() => {
        'name': name,
        'quantity': quantity,
        'price': price,
        'currency': currency,
      };
  factory Item.fromEntity(CartItemEntity entity) {
    return Item(
        name: entity.productsEntity.name,
        quantity: entity.quantity,
        price: entity.productsEntity.price.toString(),
        currency: getCurrency());
  }
}
