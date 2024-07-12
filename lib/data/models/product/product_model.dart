// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:mca_project/data/models/category/product_category.dart';

class Product {
  final String id;
  final String name;
  final String brand;
  final String shortDescription;
  final List<String> images;
  final int price;
  final int? discountInPercentage;
  final String completeDescription;
  final String shopId;
  final int stockQuantity;
  final double? rating;
  final SpecificCategory category;
  final List<Color> colors;
  final List<ProductReview> reviews;
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
    required this.reviews,
  });

  Product copyWith({
    String? id,
    String? name,
    String? brand,
    String? shortDescription,
    List<String>? images,
    int? price,
    int? discountInPercentage,
    String? completeDescription,
    String? shopId,
    int? stockQuantity,
    double? rating,
    SpecificCategory? category,
    List<Color>? colors,
    List<ProductReview>? reviews,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      brand: brand ?? this.brand,
      shortDescription: shortDescription ?? this.shortDescription,
      images: images ?? this.images,
      price: price ?? this.price,
      discountInPercentage: discountInPercentage ?? this.discountInPercentage,
      completeDescription: completeDescription ?? this.completeDescription,
      shopId: shopId ?? this.shopId,
      stockQuantity: stockQuantity ?? this.stockQuantity,
      rating: rating ?? this.rating,
      category: category ?? this.category,
      colors: colors ?? this.colors,
      reviews: reviews ?? this.reviews,
    );
  }

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'id': id,
  //     'name': name,
  //     'brand': brand,
  //     'shortDescription': shortDescription,
  //     'images': images,
  //     'price': price,
  //     'discountInPercentage': discountInPercentage,
  //     'completeDescription': completeDescription,
  //     'shopId': shopId,
  //     'stockQuantity': stockQuantity,
  //     'rating': rating,
  //     'category': category.toMap(),
  //     'colors': colors.map((x) => x.value).toList(),
  //     'reviews': reviews.map((x) => x.toMap()).toList(),
  //   };
  // }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as String,
      name: map['name'] as String,
      brand: map['brand'] as String,
      shortDescription: map['shortDescription'] as String,
      images: List<String>.from(map['images']),
      price: map['price'] as int,
      discountInPercentage: map['discountInPercentage'] != null
          ? map['discountInPercentage'] as int
          : null,
      completeDescription: map['completeDescription'] as String,
      shopId: map['shopId'] as String,
      stockQuantity: map['stockQuantity'] as int,
      rating: map['rating'] != null ? map['rating'] as double : null,
      category: GeneralSpecificCategory(name: "dummy"),
      // category:
      //     SpecificCategory.fromMap(map['category'] as Map<String, dynamic>),
      colors: List<Color>.from(
          (map['colors'] as List<int>).map<Color>((x) => Color(x))),
      reviews: List<ProductReview>.from((map['reviews'] as List<int>)
          .map<ProductReview>(
              (x) => ProductReview.fromMap(x as Map<String, dynamic>))),
    );
  }

  // String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(id: $id, name: $name, brand: $brand, shortDescription: $shortDescription, images: $images, price: $price, discountInPercentage: $discountInPercentage, completeDescription: $completeDescription, shopId: $shopId, stockQuantity: $stockQuantity, rating: $rating, category: $category, colors: $colors, reviews: $reviews)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.brand == brand &&
        other.shortDescription == shortDescription &&
        listEquals(other.images, images) &&
        other.price == price &&
        other.discountInPercentage == discountInPercentage &&
        other.completeDescription == completeDescription &&
        other.shopId == shopId &&
        other.stockQuantity == stockQuantity &&
        other.rating == rating &&
        other.category == category &&
        listEquals(other.colors, colors) &&
        listEquals(other.reviews, reviews);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        brand.hashCode ^
        shortDescription.hashCode ^
        images.hashCode ^
        price.hashCode ^
        discountInPercentage.hashCode ^
        completeDescription.hashCode ^
        shopId.hashCode ^
        stockQuantity.hashCode ^
        rating.hashCode ^
        category.hashCode ^
        colors.hashCode ^
        reviews.hashCode;
  }
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

  ProductReview copyWith({
    String? id,
    String? username,
    String? review,
    String? image,
    int? rating,
  }) {
    return ProductReview(
      id: id ?? this.id,
      username: username ?? this.username,
      review: review ?? this.review,
      image: image ?? this.image,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'review': review,
      'image': image,
      'rating': rating,
    };
  }

  factory ProductReview.fromMap(Map<String, dynamic> map) {
    return ProductReview(
      id: map['id'] as String,
      username: map['username'] as String,
      review: map['review'] as String,
      image: map['image'] != null ? map['image'] as String : null,
      rating: map['rating'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductReview.fromJson(String source) =>
      ProductReview.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductReview(id: $id, username: $username, review: $review, image: $image, rating: $rating)';
  }

  @override
  bool operator ==(covariant ProductReview other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.username == username &&
        other.review == review &&
        other.image == image &&
        other.rating == rating;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        username.hashCode ^
        review.hashCode ^
        image.hashCode ^
        rating.hashCode;
  }
}
