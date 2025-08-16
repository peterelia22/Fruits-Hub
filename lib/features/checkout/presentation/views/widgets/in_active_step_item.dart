import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class InActiveStepItem extends StatelessWidget {
  const InActiveStepItem(
      {super.key, required this.stepNumber, required this.text});
  final String stepNumber;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
            radius: 10,
            backgroundColor: const Color(0xFFF2F3F3),
            child: Text(stepNumber,
                style: TextStyles.semiBold13
                    .copyWith(color: const Color(0xFF0C0D0D)))),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: TextStyles.semiBold13.copyWith(color: const Color(0xFFAAAAAA)),
        )
      ],
    );
  }
}
