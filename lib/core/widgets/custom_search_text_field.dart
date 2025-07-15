import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/assets.dart';
import 'package:svg_flutter/svg.dart';

import '../utils/app_text_styles.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 9,
            offset: Offset(0, 2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            prefixIcon: SizedBox(
              height: 20,
              width: 20,
              child: Center(
                child: SvgPicture.asset(
                  Assets.imagesSearchIcon,
                ),
              ),
            ),
            suffixIcon: SizedBox(
              width: 20,
              height: 20,
              child: Center(
                child: SvgPicture.asset(
                  Assets.imagesFilterIcon,
                ),
              ),
            ),
            hintStyle:
                TextStyles.regular13.copyWith(color: const Color(0XFF949D9e)),
            hintText: 'ابحث عن.......',
            filled: true,
            fillColor: Colors.white,
            border: buildBorder(),
            enabledBorder: buildBorder(),
            focusedBorder: buildBorder()),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: const BorderSide(width: 1, color: Colors.white));
  }
}
