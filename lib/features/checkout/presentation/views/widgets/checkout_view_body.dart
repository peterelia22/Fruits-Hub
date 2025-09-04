import 'dart:developer';
import 'dart:math' hide log;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/helper_functions/build_error_bar.dart';
import 'package:fruits_hub/core/helper_functions/process_paypal_payment.dart';
import 'package:fruits_hub/core/utils/app_keys.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_hub/features/checkout/domain/entities/paypal_payment_entity/paypal_payment_entity.dart';
import 'package:fruits_hub/features/checkout/presentation/manager/place_order_cubit/place_order_cubit.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/checkout_steps.dart';

import '../../../../../core/helper_functions/process_paymob_payment.dart';
import 'checkout_steps_page_view.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;
  ValueNotifier<AutovalidateMode> valueNotifier =
      ValueNotifier(AutovalidateMode.disabled);
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPageIndex = pageController.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    valueNotifier.dispose();
    super.dispose();
  }

  int currentPageIndex = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          CheckoutSteps(
            pageController: pageController,
            currentPageIndex: currentPageIndex,
          ),
          Expanded(
              child: CheckoutStepsPageView(
            valueListenable: valueNotifier,
            pageController: pageController,
            formKey: _formKey,
          )),
          CustomButton(
              onPressed: () async {
                if (currentPageIndex == 0) {
                  handleShippingSectionValidation(context);
                } else if (currentPageIndex == 1) {
                  handleAddressValidation();
                } else {
                  final orderEntity = context.read<OrderEntity>();
                  if (orderEntity.payWithCash == true) {
                    await context
                        .read<PlaceOrderCubit>()
                        .placeOrder(order: orderEntity);
                  } else {
                    final isSuccess = await processPaymobPayment(context);

                    if (isSuccess) {
                      await context
                          .read<PlaceOrderCubit>()
                          .placeOrder(order: orderEntity);
                      buildErrorBar(context, 'تم الدفع بنجاح ');
                    } else {
                      buildErrorBar(context, 'فشل الدفع ');
                    }
                  }
                }
              },
              text: getNextButtonText(currentPageIndex)),
          const SizedBox(
            height: 32,
          )
        ],
      ),
    );
  }

  void handleShippingSectionValidation(BuildContext context) {
    if (context.read<OrderEntity>().payWithCash != null) {
      pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    } else {
      buildErrorBar(context, 'يرجي تحديد طريقة الدفع');
    }
  }

  String getNextButtonText(int currentPageIndex) {
    switch (currentPageIndex) {
      case 0:
        return 'التالي';
      case 1:
        return 'التالي';
      case 2:
        if (context.read<OrderEntity>().payWithCash == true) {
          return 'تأكيد الطلب';
        } else {
          return 'ادفع باستخدام باي بال';
        }
      default:
        return 'التالي';
    }
  }

  void handleAddressValidation() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.bounceIn);
    } else {
      valueNotifier.value = AutovalidateMode.always;
    }
  }
}
