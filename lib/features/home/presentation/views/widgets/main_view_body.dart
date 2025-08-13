import 'package:flutter/material.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({
    super.key,
    required this.currentIndex,
    required this.views,
  });

  final int currentIndex;
  final List<Widget> views;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: currentIndex,
      children: views,
    );
  }
}
