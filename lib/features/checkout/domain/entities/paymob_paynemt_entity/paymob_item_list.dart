import 'package:fruits_hub/features/checkout/domain/entities/paymob_paynemt_entity/paymob_item.dart';

import '../../../../home/domain/entites/cart_item_entity.dart';

class PaymobItemList {
  List<PaymobItem>? items;

  PaymobItemList({this.items});

  factory PaymobItemList.fromEntity(List<CartItemEntity> items) {
    return PaymobItemList(
      items: items.map((e) => PaymobItem.fromEntity(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'items': items?.map((e) => e.toJson()).toList(),
      };
}
