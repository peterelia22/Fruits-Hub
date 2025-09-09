import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruits_hub/features/home/presentation/views/products_view.dart';

import 'cart_view.dart';
import 'widgets/custom_bottom_navigation_bar.dart';
import 'widgets/home_view.dart';
import 'widgets/main_view_body.dart';
import 'widgets/main_view_body_bloc_consumer.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const String routeName = 'home';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 0;

  final List<Widget> views = [
    const HomeView(),
    const ProductsView(),
    const CartView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: SafeArea(
        child:
            MainViewBodyBlocConsumer(currentIndex: currentIndex, views: views),
      ),
    );
  }
}
