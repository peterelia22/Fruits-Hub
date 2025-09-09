import 'package:flutter/material.dart';
import 'package:fruits_hub/core/entities/products_entity.dart';
import 'package:fruits_hub/core/helper_functions/build_feature_list.dart';
import 'package:fruits_hub/core/helper_functions/build_fruit_actions_button.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/fruit_add_to_cart_button_builder.dart';
import 'package:fruits_hub/core/widgets/product_image_banner.dart';

class FruitDetailsBody extends StatefulWidget {
  const FruitDetailsBody({super.key, required this.productsEntity});
  final ProductsEntity productsEntity;

  @override
  State<FruitDetailsBody> createState() => _FruitDetailsBodyState();
}

class _FruitDetailsBodyState extends State<FruitDetailsBody> {
  int quantity = 1;

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              ProductImageBanner(widget: widget),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.productsEntity.name,
                                textAlign: TextAlign.right,
                                style: TextStyles.bold16,
                              ),
                              const SizedBox(height: 4),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          '${widget.productsEntity.price} جنية',
                                      style: TextStyles.bold13.copyWith(
                                        color: AppColors.secondaryColor,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' / ',
                                      style: TextStyles.bold13.copyWith(
                                        color: AppColors.lightSecondaryColor,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'الكيلو',
                                      style: TextStyles.semiBold13.copyWith(
                                        color: AppColors.lightSecondaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ],
                          ),
                        ),
                        buildFruitActionsButton(
                            incrementQuantity, decrementQuantity, quantity),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      widget.productsEntity.description,
                      style: TextStyles.regular13.copyWith(
                        color: Colors.grey[600],
                      ),
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 24),
                    buildFeatureList(widget.productsEntity),
                    const SizedBox(height: 32),
                    FruitAddToCartButtonBlocBuilder(
                        widget: widget, quantity: quantity),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).padding.top + 16,
          right: 16,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 22,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Icon(Icons.arrow_back_ios),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
