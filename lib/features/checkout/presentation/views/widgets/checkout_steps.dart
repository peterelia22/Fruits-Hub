import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/step_item.dart';

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
                  pageController.animateToPage(index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn);
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
