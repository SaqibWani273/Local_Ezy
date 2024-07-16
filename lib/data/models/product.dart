import 'package:json_annotation/json_annotation.dart';

import 'package:mca_project/data/models/category/product_category.dart';

import 'category/specific_category/specific_category.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  final String id;
  final String name;
  final String brand;
  final String shortDescription;
  final List<String> images;
  final int price;
  final double? discountInPercentage;
  final String completeDescription;
  final String shopId;
  final int stockQuantity;
  final double? rating;
  final SpecificCategory category;
  final List<String> colors;
  final bool isAvailable;
  final List<ProductReview>? reviews;
  final String sku; //stock keeping unit
  Product({
    required this.id,
    required this.name,
    required this.brand,
    required this.shortDescription,
    required this.images,
    required this.price,
    this.discountInPercentage,
    required this.completeDescription,
    required this.shopId,
    required this.stockQuantity,
    this.rating,
    required this.category,
    required this.colors,
    required this.isAvailable,
    required this.sku,
    required this.reviews,
  });
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable()
class ProductReview {
  final String id;

  final String username;
  final String review;
  final String? image;
  final int rating;
  ProductReview({
    required this.id,
    required this.username,
    required this.review,
    this.image,
    required this.rating,
  });
  factory ProductReview.fromJson(Map<String, dynamic> json) =>
      _$ProductReviewFromJson(json);
  Map<String, dynamic> toJson() => _$ProductReviewToJson(this);
}
