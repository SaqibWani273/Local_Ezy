// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductCategory _$ProductCategoryFromJson(Map<String, dynamic> json) =>
    ProductCategory(
      name: json['name'] as String,
      image: json['image'] as String,
      isTopProductCategory: json['isTopProductCategory'] as bool,
      description: json['description'] as String,
    );

Map<String, dynamic> _$ProductCategoryToJson(ProductCategory instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'isTopProductCategory': instance.isTopProductCategory,
    };
