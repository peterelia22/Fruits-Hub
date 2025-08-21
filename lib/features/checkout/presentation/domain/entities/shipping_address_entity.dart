class ShippingAddressEntity {
  final String name;
  final String address;
  final String city;
  final String email;
  final String addressDetails;

  final String phoneNumber;

  ShippingAddressEntity(
      {required this.name,
      required this.address,
      required this.city,
      required this.email,
      required this.addressDetails,
      required this.phoneNumber});
}
