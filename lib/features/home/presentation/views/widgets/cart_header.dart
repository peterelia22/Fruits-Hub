import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        color: const Color(0xFFEBF9F1),
      ),
      child: const Center(
        child: Text(
          'لديك 3 منتجات في سله التسوق',
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 13,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w400,
            height: 1.60,
          ),
        ),
      ),
    );
  }
}
