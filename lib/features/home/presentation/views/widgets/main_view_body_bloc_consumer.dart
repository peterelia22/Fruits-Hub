import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper_functions/build_error_bar.dart';
import 'package:fruits_hub/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';

import 'main_view_body.dart';

class MainViewBodyBlocConsumer extends StatelessWidget {
  const MainViewBodyBlocConsumer({
    super.key,
    required this.currentIndex,
    required this.views,
  });

  final int currentIndex;
  final List<Widget> views;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartItemAdded) {
          buildErrorBar(context, 'تم إضافة المنتج إلى السلة');
        }
        if (state is CartItemRemoved) {
          buildErrorBar(context, 'تم حذف المنتج من السلة');
        }
      },
      child: MainViewBody(currentIndex: currentIndex, views: views),
    );
  }
}
