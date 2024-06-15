import 'package:flutter/material.dart';

import '../category_model.dart';
import 'product_model.dart';

class ClothingFashionProduct implements Product {
  @override
  final String id;
  @override
  final String name;
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
  final String shortDescription;

  @override
  final String brand;

  @override
  final List<Color> colors;
  final List<String> sizes;
  @override
  final List<ProductReview> reviews;

  const ClothingFashionProduct({
    required this.id,
    required this.name,
    required this.images,
    required this.price,
    this.discountInPercentage,
    required this.completeDescription,
    required this.shortDescription,
    required this.brand,
    required this.colors,
    required this.sizes,
    required this.shopId,
    required this.stockQuantity,
    this.rating,
    required this.category,
    required this.reviews,
  });
}
