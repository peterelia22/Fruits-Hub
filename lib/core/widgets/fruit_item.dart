import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:svg_flutter/svg.dart';

import '../utils/assets.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 163,
      height: 216,
      decoration: ShapeDecoration(
        color: const Color(0xFFF3F5F7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            top: 0,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_outline),
            ),
          ),
          Positioned.fill(
              child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Image.asset(Assets.imagesWatermelon),
              const SizedBox(
                height: 24,
              ),
              ListTile(
                title: const Text('بطيخ',
                    textAlign: TextAlign.right, style: TextStyles.semiBold13),
                subtitle: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: '20جنية ',
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
                trailing: CircleAvatar(
                  backgroundColor: AppColors.primaryColor,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
