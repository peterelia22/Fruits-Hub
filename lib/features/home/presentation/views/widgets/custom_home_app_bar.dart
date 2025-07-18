import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/assets.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '../../../../../core/utils/app_text_styles.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Image.asset(Assets.imagesUserAvatar),
        title: Text(
          'صباح الخير !..',
          textAlign: TextAlign.right,
          style: TextStyles.regular16.copyWith(
            color: const Color(0xFF949D9E),
          ),
        ),
        subtitle: const Text('أحمد مصطفي',
            textAlign: TextAlign.right, style: TextStyles.bold16),
        trailing: Container(
          padding: const EdgeInsets.all(12),
          decoration: const ShapeDecoration(
              color: Color(0xFFEEF8ED), shape: OvalBorder()),
          child: SvgPicture.asset(Assets.imagesNotification),
        ));
  }
}
