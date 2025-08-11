import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helper_functions/build_app_bar.dart';

import 'widgets/best_selling_fruits_view_body.dart';

class BestSellingFruitsView extends StatelessWidget {
  const BestSellingFruitsView({super.key});
  static const String routeName = 'best-selling-fruits';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'الأكثر مبيعًا'),
      body: const BestSellingFruitsViewBody(),
    );
  }
}
