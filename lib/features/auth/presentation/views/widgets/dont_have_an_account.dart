import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/features/auth/presentation/views/sign_up_view.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
              text: 'لا تمتلك حساب؟ ',
              style: TextStyles.semiBold16.copyWith(color: Color(0XFF949D9E))),
          TextSpan(
              text: ' ',
              style: TextStyles.semiBold16.copyWith(color: Color(0xff616a5b))),
          TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushNamed(context, SignUpView.routeName);
                },
              text: 'قم بانشاء حساب',
              style: TextStyles.semiBold16
                  .copyWith(color: AppColors.primaryColor)),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
