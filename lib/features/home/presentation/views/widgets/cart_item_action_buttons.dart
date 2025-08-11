import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

import 'cart_item_action_button.dart';

class CartItemActionButtons extends StatelessWidget {
  const CartItemActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CartItemActionButton(
            iconColor: Colors.white,
            icon: Icons.add,
            color: AppColors.primaryColor,
            onPressed: () {}),
        const Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
            child: Text('3',
                textAlign: TextAlign.center, style: TextStyles.bold16)),
        CartItemActionButton(
            iconColor: Colors.grey,
            icon: Icons.remove,
            color: const Color(0xFFF3F5F7),
            onPressed: () {})
      ],
    );
  }
}
