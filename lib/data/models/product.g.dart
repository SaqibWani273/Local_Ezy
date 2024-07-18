// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as int,
      name: json['name'] as String,
      brand: json['brand'] as String,
      shortDescription: json['shortDescription'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      price: (json['price'] as num).toInt(),
      discountInPercentage: (json['discountInPercentage'] as num?)?.toDouble(),
      completeDescription: json['completeDescription'] as String,
      shop: ShopModel.fromMap(json['shop'] as Map<String, dynamic>),
      stockQuantity: (json['stockQuantity'] as num).toInt(),
      rating: (json['rating'] as num?)?.toDouble(),
      category: GeneralSpecificCategory.fromJson(
          json['category'] as Map<String, dynamic>),
      colors:
          (json['colors'] as List<dynamic>).map((e) => e as String).toList(),
      available: json['available'] as bool,
      sku: json['sku'] as String,
      // reviews: (json['reviews'] as List<dynamic>?)
      //     ?.map((e) => ProductReview.fromJson(e as Map<String, dynamic>))
      //     .toList(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'brand': instance.brand,
      'shortDescription': instance.shortDescription,
      'images': instance.images,
      'price': instance.price,
      'discountInPercentage': instance.discountInPercentage,
      'completeDescription': instance.completeDescription,
      'shop': instance.shop.toMap(),
      'stockQuantity': instance.stockQuantity,
      'rating': instance.rating,
      'category': instance.category.toMap(),
      'colors': instance.colors,
      'available': instance.available,
      // 'reviews': instance.reviews,
      'sku': instance.sku,
    };

ProductReview _$ProductReviewFromJson(Map<String, dynamic> json) =>
    ProductReview(
      id: json['id'] as String,
      username: json['username'] as String,
      review: json['review'] as String,
      image: json['image'] as String?,
      rating: (json['rating'] as num).toInt(),
    );

Map<String, dynamic> _$ProductReviewToJson(ProductReview instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'review': instance.review,
      'image': instance.image,
      'rating': instance.rating,
    };
