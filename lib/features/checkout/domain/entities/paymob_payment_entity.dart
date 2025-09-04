import 'order_entity.dart';
import 'paymob_paynemt_entity/paymob_billing_data.dart';
import 'paymob_paynemt_entity/paymob_customer.dart';
import 'paymob_paynemt_entity/paymob_item_list.dart';

class PaymobPaymentEntity {
  double? amount;
  String? currency;
  List<int>? paymentMethods;
  PaymobItemList? itemList;
  PaymobBillingData? billingData;
  PaymobCustomer? customer;

  PaymobPaymentEntity({
    this.amount,
    this.currency,
    this.paymentMethods,
    this.itemList,
    this.billingData,
    this.customer,
  });

  factory PaymobPaymentEntity.fromEntity(OrderEntity entity) {
    return PaymobPaymentEntity(
      amount: entity.calcualteTotalOrderPriceAfterDiscountAndShipping() * 100,
      currency: 'EGP',
      paymentMethods: [5266565, 5266567],
      itemList: PaymobItemList.fromEntity(entity.cartEntity.cartItems),
      billingData: PaymobBillingData.fromEntity(entity),
      customer: PaymobCustomer.fromEntity(entity),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'currency': currency,
      'payment_methods': paymentMethods,
      'items': itemList?.toJson()['items'],
      'billing_data': billingData?.toJson(),
      'customer': customer?.toJson(),
    };
  }
}
