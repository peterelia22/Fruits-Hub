import 'package:flutter/material.dart';

import 'widgets/best_selling_fruits_view_body.dart';

class BestSellingFruitsView extends StatelessWidget {
  const BestSellingFruitsView({super.key});
  static const String routeName = 'best-selling-fruits';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BestSellingFruitsViewBody(),
    );
  }
}
