import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/utils/assets.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../best_selling_fruits/presentation/views/best_selling_fruits_view.dart';

class ProductsHeader extends StatelessWidget {
  const ProductsHeader({super.key, required this.productsLength});
  final int productsLength;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('$productsLength نتائج',
            textAlign: TextAlign.right, style: TextStyles.bold16),
        SvgPicture.asset(Assets.imagesArrowSwapHorizontal)
      ],
    );
  }
}
