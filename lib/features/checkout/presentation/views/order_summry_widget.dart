import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_styles.dart';
import 'widgets/payment_item.dart';

class OrderSummaryWidget extends StatelessWidget {
  const OrderSummaryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      title: 'ملخص الطلب :',
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'المجموع الفرعي :',
                style: TextStyles.regular13.copyWith(
                  color: const Color(0xFF4E5556),
                ),
              ),
              const Text('150 جنيه',
                  textAlign: TextAlign.right, style: TextStyles.semiBold16)
            ],
          ),
          const SizedBox(
            height: 9,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'التوصيل  :',
                style: TextStyles.regular13.copyWith(
                  color: const Color(0xFF4E5556),
                ),
              ),
              Text('30جنية',
                  textAlign: TextAlign.right,
                  style: TextStyles.semiBold13
                      .copyWith(color: const Color(0xFF4E5556)))
            ],
          ),
          const SizedBox(
            height: 9,
          ),
          const Divider(thickness: 0.50, color: Color(0xFFCACECE)),
          const SizedBox(
            height: 9,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('الكلي', style: TextStyles.bold16),
              Text('180 جنيه', style: TextStyles.bold16)
            ],
          )
        ],
      ),
    );
  }
}
