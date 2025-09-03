import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper_functions/build_error_bar.dart';
import 'package:fruits_hub/core/widgets/csutom_progress_hud.dart';
import 'package:fruits_hub/features/checkout/presentation/manager/place_order_cubit/place_order_cubit.dart';

class PlaceOrderCubitBlocBuilder extends StatelessWidget {
  const PlaceOrderCubitBlocBuilder({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlaceOrderCubit, PlaceOrderState>(
      listener: (context, state) {
        if (state is PlaceOrderSuccess) {
          return buildErrorBar(context, 'تمت العملية بنجاح');
        }
        if (state is PlaceOrderFailure) {
          return buildErrorBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is PlaceOrderLoading,
          child: child,
        );
      },
    );
  }
}
