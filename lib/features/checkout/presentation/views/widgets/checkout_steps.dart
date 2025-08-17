import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/step_item.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          getSteps().length,
          (index) => Expanded(
                  child: StepItem(
                stepNumber: index.toString(),
                text: getSteps()[index],
                isActive: true,
              ))),
    );
  }
}

List<String> getSteps() {
  return ['الشحن', 'العنوان', 'الدفع', 'المراجعه'];
}
