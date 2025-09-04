import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:fruits_hub/core/helper_functions/build_error_bar.dart';
import 'package:fruits_hub/core/utils/app_keys.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_hub/features/checkout/domain/entities/paypal_payment_entity/paypal_payment_entity.dart';

void processPayPalPayment(BuildContext context) {
  var orderEntity = context.read<OrderEntity>();
  PaypalPaymentEntity paymentEntity =
      PaypalPaymentEntity.fromEntity(orderEntity);
  log(paymentEntity.toJson().toString());
  Navigator.of(context).push(MaterialPageRoute(
    builder: (BuildContext context) => PaypalCheckoutView(
      sandboxMode: true,
      clientId: kPaypalClientId,
      secretKey: kPaypalSecretKey,
      transactions: [
        paymentEntity.toJson(),
      ],
      note: "Contact us for any questions on your order.",
      onSuccess: (Map params) async {
        print("onSuccess: $params");
      },
      onError: (error) {
        print("onError: $error");
        log(error.toString());
        buildErrorBar(context, error.toString());
        Navigator.pop(context);
      },
      onCancel: () {
        print('cancelled:');
      },
    ),
  ));
}
