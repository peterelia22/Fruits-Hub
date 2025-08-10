import 'dart:io';

import 'package:fruits_hub/core/entities/products_entity.dart';

ProductsEntity getDummyProduct() {
  return ProductsEntity(
    name: 'Apple',
    description: 'Fresh and juicy apple',
    price: 1.99,
    imageUrl: null,
    code: 'APPL123',
    expirationMonths: 6,
    numOfCalories: 52,
    gramAmount: 150,
    imageFile: File(''),
    reviews: [],
    isFeatured: true,
    isOrganic: true,
  );
}

List<ProductsEntity> getDummyProducts() {
  return List.generate(10, (index) => getDummyProduct());
}
