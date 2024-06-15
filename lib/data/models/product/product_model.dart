// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:mca_project/data/models/category_model.dart';

abstract class Product {
  abstract final String id;
  abstract final String name;
  abstract final String brand;
  abstract final String shortDescription;
  abstract final List<String> images;
  abstract final int price;
  abstract final int? discountInPercentage;
  abstract final String completeDescription;
  abstract final String shopId;
  abstract final int stockQuantity;
  abstract final double? rating;
  abstract final CategoryType category;
  abstract final List<Color> colors;
  abstract final List<ProductReview> reviews;
}

class OtherProduct implements Product {
  @override
  final String id;
  @override
  final String name;
  @override
  final String brand;
  @override
  final String shortDescription;
  @override
  final List<String> images;
  @override
  final int price;
  @override
  final int? discountInPercentage;
  @override
  final String completeDescription;
  @override
  final String shopId;
  @override
  final int stockQuantity;
  @override
  final double? rating;
  @override
  final CategoryType category;
  @override
  final List<Color> colors;
  @override
  final List<ProductReview> reviews;
  const OtherProduct({
    required this.id,
    required this.name,
    required this.brand,
    required this.shortDescription,
    required this.images,
    required this.price,
    required this.discountInPercentage,
    required this.completeDescription,
    required this.shopId,
    required this.stockQuantity,
    required this.rating,
    required this.category,
    required this.colors,
    required this.reviews,
  });
}

extension DiscountExtension on Product {
  int get discountedPrice => discountInPercentage == null
      ? 0
      : (price * (100 - discountInPercentage!) / 100).toInt();
}

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
}
