import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';

class PaymobCustomer {
  String? firstName;
  String? lastName;
  String? email;
  Map<String, dynamic>? extras;

  PaymobCustomer({
    this.firstName,
    this.lastName,
    this.email,
    this.extras,
  });

  factory PaymobCustomer.fromEntity(OrderEntity entity) {
    return PaymobCustomer(
      firstName: entity.shippingAddress.name ?? 'العميل',
      lastName: entity.uID ?? 'الكريم',
      email: entity.shippingAddress.email ?? 'customer@example.com',
      extras: {
        'customer_id': entity.uID ?? '',
        'customer_phone': entity.shippingAddress.phoneNumber ?? '',
      },
    );
  }

  Map<String, dynamic> toJson() => {
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        if (extras != null) 'extras': extras,
      };
}
