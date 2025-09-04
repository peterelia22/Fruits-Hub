import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper_functions/build_error_bar.dart';
import 'package:fruits_hub/core/services/paymob_service.dart';
import 'package:fruits_hub/core/utils/app_keys.dart';
import 'package:fruits_hub/features/checkout/domain/entities/paymob_payment_entity.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/paymob_checkout_view.dart';

import '../../features/checkout/domain/entities/order_entity.dart';

Future<bool> processPaymobPayment(BuildContext context) async {
  var orderEntity = context.read<OrderEntity>();
  PaymobPaymentEntity paymentEntity =
      PaymobPaymentEntity.fromEntity(orderEntity);

  log('Paymob payment entity: ${paymentEntity.toJson()}');

  // Initialize Paymob service
  final paymobService = PaymobService(
    secretKey: kPaymobSecretKey,
    publicKey: kPaymobPublicKey,
  );

  try {
    final response = await paymobService.createPaymentIntention(paymentEntity);

    if (response != null && response['client_secret'] != null) {
      final checkoutUrl =
          paymobService.generateCheckoutUrl(response['client_secret']);

      final result = await Navigator.of(context).push<bool>(
        MaterialPageRoute(
          builder: (BuildContext context) => PaymobCheckoutView(
            checkoutUrl: checkoutUrl,
            note: "تواصل معنا لأي استفسارات حول طلبك",
            onSuccess: (Map<String, dynamic> params) async {
              print("onSuccess: $params");
              Navigator.pop(context, true);
            },
            onError: (String error) {
              print("onError: $error");
              log(error.toString());
              buildErrorBar(context, error);
              Navigator.pop(context, false);
            },
            onCancel: () {
              print('Payment cancelled');
              Navigator.pop(context, false);
            },
          ),
        ),
      );

      return result ?? false;
    } else {
      buildErrorBar(context, 'فشل في إنشاء عملية الدفع');
      return false;
    }
  } catch (error) {
    log('Error in processPaymobPayment: $error');
    buildErrorBar(context, 'خطأ في الاتصال بخدمة الدفع');
    return false;
  }
}
