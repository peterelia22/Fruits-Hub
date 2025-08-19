import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/utils/assets.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/payment_item.dart';
import 'package:svg_flutter/svg.dart';

import '../order_summry_widget.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 24,
        ),
        const OrderSummaryWidget(),
        const SizedBox(
          height: 5,
        ),
        PaymentItem(
            title: 'عنوان التوصيل',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(Assets.imagesLocation),
                    const SizedBox(
                      width: 8,
                    ),
                    Text('شارع النيل، مبنى رقم ١٢٣',
                        textAlign: TextAlign.right,
                        style: TextStyles.regular16
                            .copyWith(color: const Color(0xFF4E5556)))
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(Assets.imagesEdit),
                    const SizedBox(
                      width: 4,
                    ),
                    Text('تعديل',
                        style: TextStyles.semiBold13
                            .copyWith(color: const Color(0xFF949D9E)))
                  ],
                )
              ],
            ))
      ],
    );
  }
}
