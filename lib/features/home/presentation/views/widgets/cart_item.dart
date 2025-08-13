import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/utils/assets.dart';
import 'package:fruits_hub/core/widgets/custom_network_image.dart';
import 'package:fruits_hub/features/home/domain/entites/cart_item_entity.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/cart_item_action_buttons.dart';
import 'package:svg_flutter/svg.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Container(
            width: 73,
            height: 92,
            decoration: const BoxDecoration(color: const Color(0xFFF3F5F7)),
            child: CustomNetworkImage(
                imageUrl: cartItemEntity.productsEntity.imageUrl!),
          ),
          const SizedBox(
            width: 17,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(cartItemEntity.productsEntity.name,
                        style: TextStyles.bold13),
                    GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(Assets.imagesTrash))
                  ],
                ),
                Text('${cartItemEntity.calculateTotalWeight().toString()} كم',
                    textAlign: TextAlign.right,
                    style: TextStyles.regular13
                        .copyWith(color: AppColors.secondaryColor)),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    const CartItemActionButtons(),
                    const Spacer(),
                    Text(
                      '${cartItemEntity.calculateTotalPrice()} جنيه ',
                      style: TextStyles.bold16
                          .copyWith(color: AppColors.secondaryColor),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
