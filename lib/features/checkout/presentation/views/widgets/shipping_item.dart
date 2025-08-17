import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.price});
  final String title, subtitle, price;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 16,
        left: 13,
        right: 28,
        bottom: 16,
      ),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: const Color(0x33D9D9D9),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 18,
              height: 18,
              decoration: const ShapeDecoration(
                shape: OvalBorder(
                  side: BorderSide(
                    width: 1,
                    color: Color(0xFF949D9E) /* Grayscale-400 */,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyles.semiBold13),
                const SizedBox(
                  height: 6,
                ),
                Text(subtitle,
                    textAlign: TextAlign.right,
                    style: TextStyles.regular13
                        .copyWith(color: Colors.black.withOpacity(0.5))),
              ],
            ),
            const Spacer(),
            Center(
              child: Text(
                price,
                style: TextStyles.bold13
                    .copyWith(color: AppColors.lightPrimaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
