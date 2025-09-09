import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/fruit_details_body.dart';
import 'package:fruits_hub/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';

class FruitAddToCartButtonBlocBuilder extends StatelessWidget {
  const FruitAddToCartButtonBlocBuilder({
    super.key,
    required this.widget,
    required this.quantity,
  });

  final FruitDetailsBody widget;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          height: 54,
          child: ElevatedButton(
            onPressed: () {
              context.read<CartCubit>().addToCart(widget.productsEntity,
                  quantity: quantity, silent: true);

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'تم إضافة $quantity من ${widget.productsEntity.name} إلى السلة',
                    textAlign: TextAlign.right,
                  ),
                  backgroundColor: AppColors.primaryColor,
                  duration: const Duration(seconds: 2),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'أضف إلى السلة',
                  style: TextStyles.bold16.copyWith(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 8),
                if (quantity > 1) ...[
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '$quantity',
                      style: TextStyles.bold13.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
