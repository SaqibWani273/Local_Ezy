// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'product_category.dart';

class ElectronicsCategory implements SpecificCategory {
  final String brand;
  final String warrantyPeriod;

  ElectronicsCategory({
    required this.brand,
    required this.warrantyPeriod,
    required this.name,
  });

  @override
  String name; //unique key
  //will be used in the product model to identify the category

  factory ElectronicsCategory.fromMap(Map<String, dynamic> map) {
    return ElectronicsCategory(
      name: map['name'] as String,
      brand: map['brand'] as String,
      warrantyPeriod: map['warrantyPeriod'] as String,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory ElectronicsCategory.fromJson(String source) => ElectronicsCategory.fromMap(json.decode(source) as Map<String, dynamic>);
}

//string to enum for ElectronicsType
// ElectronicsType electronicsTypeFromString(String name) {
//   return ElectronicsType.values.firstWhere((element) => element.name == name);
// }

// enum ElectronicsType { laptop, mobile, tv, others }
