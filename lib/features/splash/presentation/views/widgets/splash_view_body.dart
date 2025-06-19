import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/assets.dart';
import 'package:svg_flutter/svg.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [SvgPicture.asset(Assets.imagesPlant)]),
        SvgPicture.asset(Assets.imagesSplashLogo),
        SvgPicture.asset(
          Assets.imagesSplashBottom,
          fit: BoxFit.fill,
        )
      ],
    );
  }
}
