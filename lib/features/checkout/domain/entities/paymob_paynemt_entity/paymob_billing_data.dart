import '../order_entity.dart';

class PaymobBillingData {
  String? apartment;
  String? firstName;
  String? lastName;
  String? street;
  String? building;
  String? phoneNumber;
  String? country;
  String? email;
  String? floor;
  String? state;
  String? postalCode;
  String? city;

  PaymobBillingData({
    this.apartment,
    this.firstName,
    this.lastName,
    this.street,
    this.building,
    this.phoneNumber,
    this.country,
    this.email,
    this.floor,
    this.state,
    this.postalCode,
    this.city,
  });

  factory PaymobBillingData.fromEntity(OrderEntity entity) {
    return PaymobBillingData(
      apartment: entity.shippingAddress.addressDetails ?? '1',
      firstName: entity.shippingAddress.name ?? 'العميل',
      lastName: entity.shippingAddress.name ?? 'الكريم',
      street: entity.shippingAddress.address ?? 'الشارع',
      building: entity.shippingAddress.addressDetails ?? '1',
      phoneNumber: entity.shippingAddress.phoneNumber ?? '+201234567890',
      country: 'EG',
      email: entity.shippingAddress.email ?? 'customer@example.com',
      floor: entity.shippingAddress.addressDetails ?? '1',
      state: entity.shippingAddress.city ?? 'القاهرة',
      postalCode: entity.shippingAddress.addressDetails ?? '12345',
      city: entity.shippingAddress.city ?? 'القاهرة',
    );
  }

  Map<String, dynamic> toJson() => {
        'apartment': apartment,
        'first_name': firstName,
        'last_name': lastName,
        'street': street,
        'building': building,
        'phone_number': phoneNumber,
        'country': country,
        'email': email,
        'floor': floor,
        'state': state,
        'postal_code': postalCode,
        'city': city,
      };
}
