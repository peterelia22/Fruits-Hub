import 'package:flutter/material.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/cart_item.dart';

import 'custom_divider_for_cart_iterm.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
        separatorBuilder: (context, index) => const CustomDividerForCartItem(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: CartItem(),
          );
        });
  }
}
