import 'package:flutter/material.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/widgets/custom_text_field.dart';

class ShippingAddressSection extends StatelessWidget {
  const ShippingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 24,
          ),
          CustomTextFormField(
              hintText: 'الاسم كامل', keyboardType: TextInputType.text),
          SizedBox(
            height: 8,
          ),
          CustomTextFormField(
              hintText: 'البريد الإلكتروني',
              keyboardType: TextInputType.emailAddress),
          SizedBox(
            height: 8,
          ),
          CustomTextFormField(
              hintText: 'العنوان', keyboardType: TextInputType.text),
          SizedBox(
            height: 8,
          ),
          CustomTextFormField(
              hintText: 'المدينه', keyboardType: TextInputType.text),
          SizedBox(
            height: 8,
          ),
          CustomTextFormField(
              hintText: 'رقم الطابق , رقم الشقه ..',
              keyboardType: TextInputType.text),
          SizedBox(
            height: 8,
          ),
          CustomTextFormField(
              hintText: 'رقم الهاتف', keyboardType: TextInputType.number)
        ],
      ),
    );
  }
}
