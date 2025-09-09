import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/entities/products_entity.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/views/fruit_details_view.dart';
import 'package:fruits_hub/core/widgets/custom_network_image.dart';
import 'package:fruits_hub/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:svg_flutter/svg.dart';

import '../utils/assets.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key, required this.productEntity});
  final ProductsEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, FruitDetailsView.routeName,
            arguments: productEntity);
      },
      child: Container(
        decoration: ShapeDecoration(
          color: const Color(0xFFF3F5F7),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        child: Stack(
          children: [
            Positioned.fill(
                child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                productEntity.imageUrl != null
                    ? Flexible(
                        child: CustomNetworkImage(
                            imageUrl: productEntity.imageUrl!))
                    : Container(
                        color: Colors.grey,
                        height: 100,
                        width: double.infinity,
                      ),
                const SizedBox(
                  height: 24,
                ),
                ListTile(
                  title: Text(productEntity.name,
                      textAlign: TextAlign.right, style: TextStyles.semiBold13),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: '${productEntity.price} جنية ',
                            style: TextStyles.bold13
                                .copyWith(color: AppColors.secondaryColor)),
                        TextSpan(
                          text: '/',
                          style: TextStyles.bold13
                              .copyWith(color: AppColors.lightSecondaryColor),
                        ),
                        TextSpan(
                          text: ' الكيلو',
                          style: TextStyles.semiBold13
                              .copyWith(color: AppColors.lightSecondaryColor),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.right,
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      context.read<CartCubit>().addToCart(productEntity);
                    },
                    child: const CircleAvatar(
                      backgroundColor: AppColors.primaryColor,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            )),
            Positioned(
              right: 0,
              top: 0,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_outline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
