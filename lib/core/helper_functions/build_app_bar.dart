import 'package:flutter/material.dart';

import '../../constants.dart';
import '../utils/app_text_styles.dart';
import '../widgets/notifcation_widget.dart';

AppBar buildAppBar({
  required String title,
  bool showNotification = true,
}) {
  return AppBar(
    actions: [
      Visibility(
        visible: showNotification,
        child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: NotifcationWidget()),
      )
    ],
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyles.bold19,
    ),
  );
}
