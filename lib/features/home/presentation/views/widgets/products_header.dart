import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/utils/assets.dart';
import 'package:svg_flutter/svg.dart';
import 'package:fruits_hub/core/cubits/products_cubit/products_cubit.dart';

class ProductsHeader extends StatelessWidget {
  const ProductsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        int productsCount = 0;

        if (state is ProductsSuccess) {
          productsCount = state.products.length;
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('$productsCount نتائج',
                textAlign: TextAlign.right, style: TextStyles.bold16),
            SvgPicture.asset(Assets.imagesArrowSwapHorizontal)
          ],
        );
      },
    );
  }
}
