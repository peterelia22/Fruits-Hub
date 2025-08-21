import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/step_item.dart';
import 'package:provider/provider.dart';

import '../../../../../core/helper_functions/build_error_bar.dart';
import '../../domain/entities/order_entity.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps(
      {super.key,
      required this.currentPageIndex,
      required this.pageController});
  final int currentPageIndex;
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          getSteps().length,
          (index) => Expanded(
                  child: GestureDetector(
                onTap: () {
                  if (context.read<OrderEntity>().payWithCash != null) {
                    pageController.animateToPage(index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                  } else {
                    buildErrorBar(context, 'يرجي تحديد طريقة الدفع');
                  }
                },
                child: StepItem(
                  stepNumber: (index + 1).toString(),
                  text: getSteps()[index],
                  isActive: index <= currentPageIndex,
                ),
              ))),
    );
  }
}

List<String> getSteps() {
  return ['الشحن', 'العنوان', 'الدفع'];
}
