import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

Row buildFruitActionsButton(void Function()? onTapIncrement,
    void Function()? onTapDecrement, int quantity) {
  return Row(
    children: [
      GestureDetector(
        onTap: onTapDecrement,
        child: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: quantity > 1 ? Colors.grey[200] : Colors.grey[100],
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.remove,
            size: 16,
            color: quantity > 1 ? Colors.grey[700] : Colors.grey[400],
          ),
        ),
      ),
      const SizedBox(width: 16),
      Text(
        '$quantity',
        style: TextStyles.bold16,
      ),
      const SizedBox(width: 16),
      GestureDetector(
        onTap: onTapIncrement,
        child: Container(
          width: 32,
          height: 32,
          decoration: const BoxDecoration(
            color: AppColors.primaryColor,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.add,
            size: 16,
            color: Colors.white,
          ),
        ),
      ),
    ],
  );
}
