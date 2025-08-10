import 'dart:io';

import '../entities/products_entity.dart';
import 'review_model.dart';

class ProductsModel {
  final String name;
  final String code;
  final String description;
  final num price;
  final File imageFile;
  final bool isFeatured;
  String? imageUrl;
  final int expirationMonths;
  bool isOrganic;
  final int numOfCalories;
  final int gramAmount;
  final num avgRating = 0;
  final num numOfRatings = 0;
  final List<ReviewModel> reviews;
  final int sellingCount;

  ProductsModel({
    required this.name,
    this.imageUrl,
    required this.code,
    required this.description,
    required this.expirationMonths,
    required this.numOfCalories,
    required this.gramAmount,
    required this.price,
    required this.imageFile,
    required this.isFeatured,
    required this.reviews,
    required this.isOrganic,
    required this.sellingCount,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      name: json['name'] ?? '',
      code: json['code'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? 0,
      imageUrl: json['imageUrl'], // This can be null
      isFeatured: json['isFeatured'] ?? false,
      expirationMonths: json['expirationMonths'] ?? 0,
      numOfCalories: json['numOfCalories'] ?? 0,
      gramAmount: json['gramAmount'] ?? 0,
      isOrganic: json['isOrganic'] ?? false,
      reviews: json['reviews'] != null
          ? (json['reviews'] as List<dynamic>)
              .map((review) =>
                  ReviewModel.fromJson(review as Map<String, dynamic>))
              .toList()
          : <ReviewModel>[],
      sellingCount: json['sellingCount'] ?? 0,
      imageFile: File(json['imageFile'] ?? ''),
    );
  }

  ProductsEntity toEntity() {
    return ProductsEntity(
      name: name,
      code: code,
      description: description,
      price: price,
      imageFile: imageFile,
      isFeatured: isFeatured,
      imageUrl: imageUrl,
      expirationMonths: expirationMonths,
      numOfCalories: numOfCalories,
      gramAmount: gramAmount,
      isOrganic: isOrganic,
      reviews: reviews.map((review) => review.toEntity()).toList(),
    );
  }

  toJson() {
    return {
      'name': name,
      'code': code,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'isFeatured': isFeatured,
      'expirationMonths': expirationMonths,
      'numOfCalories': numOfCalories,
      'gramAmount': gramAmount,
      'isOrganic': isOrganic,
      'reviews': reviews.map((review) => review.toJson()).toList(),
    };
  }
}
