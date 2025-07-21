import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/assets.dart';
import 'package:fruits_hub/features/home/domain/entites/bottom_navigation_bar.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/active_item.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/in_active_item.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem(
      {super.key,
      required this.isActive,
      required this.bottomNavigationBarEntity});
  final bool isActive;
  final BottomNavigationBarEntity bottomNavigationBarEntity;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? const ActiveItem()
        : InActiveItem(image: bottomNavigationBarEntity.inActiveImage);
  }
}
