import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = 'home';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
<<<<<<< HEAD
      body: SafeArea(child: HomeViewBody()),
=======
      body: HomeViewBody(),
>>>>>>> 0eb302c36427c02580c874d2372c63def09d5742
    );
  }
}
