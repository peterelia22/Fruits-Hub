import 'package:fruits_hub/features/checkout/domain/entities/shipping_address_entity.dart';

class ShippingAddressModel {
  String? name;
  String? address;
  String? city;
  String? email;
  String? addressDetails;

  String? phoneNumber;
  @override
  String toString() {
    return '$address $addressDetails $city';
  }

  factory ShippingAddressModel.fromEntity(ShippingAddressEntity entity) {
    return ShippingAddressModel(
        name: entity.name,
        phoneNumber: entity.phoneNumber,
        address: entity.address,
        addressDetails: entity.addressDetails,
        city: entity.city,
        email: entity.email);
  }
  ShippingAddressModel(
      {this.name,
      this.address,
      this.city,
      this.email,
      this.addressDetails,
      this.phoneNumber});
  toJson() {
    return {
      'name': name,
      'phone': phoneNumber,
      'address': address,
      'floor': addressDetails,
      'city': city,
      'email': email
    };
  }
}
