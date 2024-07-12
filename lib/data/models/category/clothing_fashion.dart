// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'product_category.dart';

class ClothingFashionCategory implements SpecificCategory {
  final String size;
  final String material;
  final Gender gender;
  final FitType? fitType;
  final Season? season;
  ClothingFashionCategory({
    required this.name,
    required this.size,
    required this.material,
    required this.gender,
    this.fitType,
    this.season,
  });
  @override
  String name; //unique key
  //will be used in the product model to identify the category
  factory ClothingFashionCategory.fromMap(Map<String, dynamic> map) {
    return ClothingFashionCategory(
      name: map['name'] as String,
      size: map['size'] as String,
      material: map['material'] as String,
      gender: genderFromString(map['gender'] as String),
      fitType: fitTypeFromString(map['fitType'] as String),
      season: seasonFromString(map['season'] as String),
    );
  }

  // String toJson() => json.encode(toMap());

  // factory ClothingFashionCategory.fromJson(String source) => ClothingFashionCategory.fromMap(json.decode(source) as Map<String, dynamic>);
}

//string to enum for FitType

FitType fitTypeFromString(String fitType) {
  return FitType.values
      .firstWhere((element) => element.name.toLowerCase() == fitType);
}

enum FitType { slim, regular, loose }

//string to enum for Gender

Gender genderFromString(String gender) {
  return Gender.values
      .firstWhere((element) => element.name.toLowerCase() == gender);
}

enum Gender { men, women, unisex }

//string to enum for Season

Season seasonFromString(String season) {
  return Season.values
      .firstWhere((element) => element.name.toLowerCase() == season);
}

enum Season { winter, summer, all }
