import '../entities/review_entity.dart';

class ReviewModel {
  final String name;
  final String reviewDescription;
  final num rating;
  final String image;
  final String date;

  ReviewModel({
    required this.name,
    required this.reviewDescription,
    required this.rating,
    required this.image,
    required this.date,
  });
  factory ReviewModel.fromEntity(ReviewEntity reviewEntity) {
    return ReviewModel(
      name: reviewEntity.name,
      reviewDescription: reviewEntity.reviewDescription,
      rating: reviewEntity.rating,
      image: reviewEntity.image,
      date: reviewEntity.date,
    );
  }
  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      name: json['name'],
      reviewDescription: json['reviewDescription'],
      rating: json['rating'],
      image: json['image'],
      date: json['date'],
    );
  }
  ReviewEntity toEntity() {
    return ReviewEntity(
      name: name,
      reviewDescription: reviewDescription,
      rating: rating,
      image: image,
      date: date,
    );
  }

  toJson() {
    return {
      'name': name,
      'reviewDescription': reviewDescription,
      'rating': rating,
      'image': image,
      'date': date,
    };
  }
}
