import 'package:flutter/material.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/helper_functions/build_app_bar.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/cart_header.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/cart_item.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

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
                buildAppBar(title: 'السلة', showNotification: false),
                const SizedBox(
                  height: kTopPadding,
                ),
                const CartHeader(),
                const SizedBox(
                  height: 12,
                ),
                const CartItem()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
