import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/active_step_item.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/in_active_step_item.dart';

class StepItem extends StatelessWidget {
  const StepItem(
      {super.key,
      required this.text,
      required this.stepNumber,
      required this.isActive});
  final String text, stepNumber;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
        firstChild: InActiveStepItem(stepNumber: stepNumber, text: text),
        secondChild: ActiveStepItem(text: text),
        crossFadeState:
            isActive ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        duration: const Duration(milliseconds: 300));
  }
}
