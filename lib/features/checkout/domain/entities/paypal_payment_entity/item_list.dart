import 'package:fruits_hub/features/home/domain/entites/cart_item_entity.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/cart_item.dart';

import 'item.dart';

class ItemList {
  List<Item>? items;

  ItemList({this.items});

  factory ItemList.fromEntity(List<CartItemEntity> items) {
    return ItemList(items: items.map((e) => Item.fromEntity(e)).toList());
  }

  Map<String, dynamic> toJson() => {
        'items': items?.map((e) => e.toJson()).toList(),
      };
}
