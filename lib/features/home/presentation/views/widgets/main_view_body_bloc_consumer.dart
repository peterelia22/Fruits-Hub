import 'package:flutter/material.dart';

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
    return MainViewBody(currentIndex: currentIndex, views: views);
  }
}
