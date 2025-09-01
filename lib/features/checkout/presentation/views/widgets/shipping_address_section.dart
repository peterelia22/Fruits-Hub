import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/widgets/custom_text_field.dart';
import 'package:fruits_hub/features/checkout/presentation/domain/entities/order_entity.dart';

class ShippingAddressSection extends StatelessWidget {
  const ShippingAddressSection(
      {super.key, required this.formKey, required this.valueListenable});
  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ValueListenableBuilder<AutovalidateMode>(
        valueListenable: valueListenable,
        builder: (context, value, child) {
          return Form(
            autovalidateMode: value,
            key: formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 24,
                ),
                CustomTextFormField(
                    onSaved: (value) {
                      context.read<OrderEntity>().shippingAddress!.name =
                          value!;
                    },
                    hintText: 'الاسم كامل',
                    keyboardType: TextInputType.text),
                const SizedBox(
                  height: 8,
                ),
                CustomTextFormField(
                    onSaved: (value) {
                      context.read<OrderEntity>().shippingAddress!.email =
                          value!;
                    },
                    hintText: 'البريد الإلكتروني',
                    keyboardType: TextInputType.emailAddress),
                const SizedBox(
                  height: 8,
                ),
                CustomTextFormField(
                    onSaved: (value) {
                      context.read<OrderEntity>().shippingAddress!.address =
                          value!;
                    },
                    hintText: 'العنوان',
                    keyboardType: TextInputType.text),
                const SizedBox(
                  height: 8,
                ),
                CustomTextFormField(
                    onSaved: (value) {
                      context.read<OrderEntity>().shippingAddress!.city =
                          value!;
                    },
                    hintText: 'المدينه',
                    keyboardType: TextInputType.text),
                const SizedBox(
                  height: 8,
                ),
                CustomTextFormField(
                    onSaved: (value) {
                      context
                          .read<OrderEntity>()
                          .shippingAddress!
                          .addressDetails = value!;
                    },
                    hintText: 'رقم الطابق , رقم الشقه ..',
                    keyboardType: TextInputType.text),
                const SizedBox(
                  height: 8,
                ),
                CustomTextFormField(
                    onSaved: (value) {
                      context.read<OrderEntity>().shippingAddress!.phoneNumber =
                          value!;
                    },
                    hintText: 'رقم الهاتف',
                    keyboardType: TextInputType.number)
              ],
            ),
          );
        },
      ),
    );
  }
}
