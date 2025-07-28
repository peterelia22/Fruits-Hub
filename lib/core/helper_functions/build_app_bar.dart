import 'package:flutter/material.dart';

import '../../constants.dart';
import '../utils/app_text_styles.dart';
import '../widgets/notifcation_widget.dart';

AppBar buildAppBar() {
  return AppBar(
    actions: const [
      Padding(
          padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: NotifcationWidget())
    ],
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    title: const Text(
      'الأكثر مبيعًا',
      textAlign: TextAlign.center,
      style: TextStyles.bold19,
    ),
  );
}
