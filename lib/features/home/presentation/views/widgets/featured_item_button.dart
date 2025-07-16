import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';

import '../../../../../core/utils/app_text_styles.dart';

class FeaturedItemButton extends StatelessWidget {
  const FeaturedItemButton({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      //     width: double.infinity,
      child: TextButton(
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              backgroundColor: Colors.white),
          onPressed: onPressed,
          child: Text('تسوق الان',
              style:
                  TextStyles.bold13.copyWith(color: AppColors.primaryColor))),
    );
  }
}
