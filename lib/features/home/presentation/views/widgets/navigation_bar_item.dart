import 'package:flutter/material.dart';

import '../../../domain/entites/bottom_navigation_bar.dart';
import 'active_item.dart';
import 'in_active_item.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    super.key,
    required this.isActive,
    required this.bottomNavigationBarEntity,
  });

  final bool isActive;
  final BottomNavigationBarEntity bottomNavigationBarEntity;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      transitionBuilder: (child, animation) {
        return ScaleTransition(scale: animation, child: child);
        // أو استخدم FadeTransition لو عايز تأثير تلاشي
        // return FadeTransition(opacity: animation, child: child);
      },
      child: isActive
          ? ActiveItem(
              //     key: const ValueKey('active'),
              text: bottomNavigationBarEntity.name,
              image: bottomNavigationBarEntity.activeImage,
            )
          : InActiveItem(
              //     key: const ValueKey('inactive'),
              image: bottomNavigationBarEntity.inActiveImage,
            ),
    );
  }
}
