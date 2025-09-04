import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper_functions/get_user.dart';
import 'package:fruits_hub/core/repos/orders_repo/orders_repo.dart';
import 'package:fruits_hub/core/services/get_it_service.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_hub/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:fruits_hub/features/checkout/presentation/manager/place_order_cubit/place_order_cubit.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/place_order_cubit_bloc_builder.dart';
import 'package:fruits_hub/features/home/domain/entites/cart_entity.dart';
import 'package:fruits_hub/features/home/domain/entites/cart_item_entity.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/cart_item.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key, required this.cartEntity});
  static const String routeName = 'checkout';
  final CartEntity cartEntity;

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  late OrderEntity orderEntity;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    orderEntity = OrderEntity(widget.cartEntity,
        shippingAddress: ShippingAddressEntity(), uID: getUser().uId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlaceOrderCubit(getIt.get<OrdersRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'الشحن'),
        body: Provider.value(
            value: orderEntity,
            child: const PlaceOrderCubitBlocBuilder(child: CheckoutViewBody())),
      ),
    );
  }
}
