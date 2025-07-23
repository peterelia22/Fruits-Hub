import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:svg_flutter/svg.dart';

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key, required this.text, required this.image});
  final String text, image;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(left: 16),
        decoration: ShapeDecoration(
          color: Color(0xffeeeeee),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: ShapeDecoration(
                color: const Color(0xFF1B5E37),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Center(child: SvgPicture.asset(image)),
            ),
            const SizedBox(
              width: 4,
            ),
            Flexible(
              child: Text(text,
                  style: TextStyles.semiBold11
                      .copyWith(color: AppColors.primaryColor)),
            )
          ],
        ),
      ),
    );
  }
}
