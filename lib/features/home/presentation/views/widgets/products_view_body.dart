import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruits_hub/core/helper_functions/build_app_bar.dart';
import 'package:fruits_hub/core/widgets/custom_search_text_field.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/best_selling_header.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/products_header.dart';

import 'products_grid_view_bloc_builder.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>().getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: kTopPadding),
                buildAppBar(title: 'المنتجات'),
                const SizedBox(
                  height: kTopPadding,
                ),
                const CustomSearchTextField(),
                const SizedBox(
                  height: 12,
                ),
                const ProductsHeader(),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
          const ProducstsGridViewBlocBuilder()
        ],
      ),
    );
  }
}
