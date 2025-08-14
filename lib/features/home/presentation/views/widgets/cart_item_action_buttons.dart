import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/home/domain/entites/cart_item_entity.dart';

import '../../cubits/cart_item_cubit/cart_item_cubit.dart';
import 'cart_item_action_button.dart';

class CartItemActionButtons extends StatelessWidget {
  const CartItemActionButtons({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CartItemActionButton(
            iconColor: Colors.white,
            icon: Icons.add,
            color: AppColors.primaryColor,
            onPressed: () {
              cartItemEntity.increaseCount();
              context.read<CartItemCubit>().updateCartItem(cartItemEntity);
            }),
        Padding(
            padding: const EdgeInsetsGeometry.symmetric(horizontal: 16),
            child: Text(cartItemEntity.count.toString(),
                textAlign: TextAlign.center, style: TextStyles.bold16)),
        CartItemActionButton(
            iconColor: Colors.grey,
            icon: Icons.remove,
            color: const Color(0xFFF3F5F7),
            onPressed: () {
              if (cartItemEntity.count > 1) {
                cartItemEntity.decreaseCount();
                context.read<CartItemCubit>().updateCartItem(cartItemEntity);
              }
            })
      ],
    );
  }
}
