import 'package:flutter/material.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/cart_item.dart';

import '../../../domain/entites/cart_item_entity.dart';
import 'custom_divider_for_cart_iterm.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({super.key, required this.cartItems});
  final List<CartItemEntity> cartItems;
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
        separatorBuilder: (context, index) => const CustomDividerForCartItem(),
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: CartItem(
              cartItemEntity: cartItems[index],
            ),
          );
        });
  }
}
