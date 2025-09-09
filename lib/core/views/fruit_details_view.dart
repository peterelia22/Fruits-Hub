import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruits_hub/core/entities/products_entity.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/core/widgets/fruit_details_body.dart';

import '../../features/home/presentation/cubits/cart_cubit/cart_cubit.dart';

class FruitDetailsView extends StatelessWidget {
  const FruitDetailsView({super.key, required this.productsEntity});
  static const routeName = 'fruit-details';
  final ProductsEntity productsEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FruitDetailsBody(
        productsEntity: productsEntity,
      ),
    );
  }
}
