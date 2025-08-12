import 'package:flutter/material.dart';

class CustomDividerForCartItem extends StatelessWidget {
  const CustomDividerForCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Color(0xFFF1F1F5),
      height: 14,
    );
  }
}
