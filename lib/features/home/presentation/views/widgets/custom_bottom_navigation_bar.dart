import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/domain/entites/bottom_navigation_bar.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/navigation_bar_item.dart';
import '../../../../../core/utils/assets.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 70,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 25,
            offset: Offset(0, -2),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        children: bottomNavigationBarItems.asMap().entries.map((e) {
          var index = e.key;
          var item = e.value;
          return Expanded(
            flex: index == currentIndex ? 3 : 2,
            child: GestureDetector(
              onTap: () => onTap(index),
              child: NavigationBarItem(
                isActive: currentIndex == index,
                bottomNavigationBarEntity: item,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
