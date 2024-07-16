// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'specific_category/specific_category.dart';

//This Model is needed to show the product categories in the customer-Dashboard
class ProductCategory {
  String name;
  String description;
  String image;
  bool isTopProductCategory;

  ProductCategory({
    required this.name,
    required this.image,
    required this.isTopProductCategory,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'image': image,
      'isTopProductCategory': isTopProductCategory,
    };
  }

  factory ProductCategory.fromMap(Map<String, dynamic> map) {
    return ProductCategory(
      name: map['name'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
      isTopProductCategory: map['isTopProductCategory'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductCategory.fromJson(String source) =>
      ProductCategory.fromMap(json.decode(source) as Map<String, dynamic>);
}

class GeneralSpecificCategory extends SpecificCategory {
  //if a category has must-have attributes, add them at the time
  //of adding the product
  final SpecificAttributesMap? mustHaveSpecificAttributes;
  final SpecificAttributesMap? canHaveSpecificAttributes;
  final String name;
  GeneralSpecificCategory({
    this.canHaveSpecificAttributes,
    this.mustHaveSpecificAttributes,
    required this.name,
  }) : super(name: name);
}

/*
SpecificAttributesMap Strucutre - >
{
"boolAttributes" : {
"boolAttribute1" : true,
"boolAttribute2" : false,
},
"stringAttributes" : {
"stringAttribute1" : "value1",
"stringAttribute2" : "value2",
},
"enumAttributes" : {
"enumAttribute1" : ["option1", "option2"],
"enumAttribute2" : ["option1", "option2"],
}
}

*/
class SpecificAttributesMap {
  final Map<String, String> stringAttributes;
  final Map<String, bool> boolAttributes;
  final Map<String, List<String>> enumAttributes;
  SpecificAttributesMap({
    required this.stringAttributes,
    required this.boolAttributes,
    required this.enumAttributes,
  });

  SpecificAttributesMap copyWith({
    Map<String, String>? stringAttributes,
    Map<String, bool>? boolAttributes,
    Map<String, List<String>>? enumAttributes,
  }) {
    return SpecificAttributesMap(
      stringAttributes: stringAttributes ?? this.stringAttributes,
      boolAttributes: boolAttributes ?? this.boolAttributes,
      enumAttributes: enumAttributes ?? this.enumAttributes,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'stringAttributes': stringAttributes,
      'boolAttributes': boolAttributes,
      'enumAttributes': enumAttributes,
    };
  }

  factory SpecificAttributesMap.fromMap(Map<String, dynamic> map) {
    return SpecificAttributesMap(
        stringAttributes: Map<String, String>.from(
            (map['stringAttributes'] as Map<String, String>)),
        boolAttributes: Map<String, bool>.from(
            (map['boolAttributes'] as Map<String, bool>)),
        enumAttributes: Map<String, List<String>>.from(
          (map['enumAttributes'] as Map<String, List<String>>),
        ));
  }

  String toJson() => json.encode(toMap());

  factory SpecificAttributesMap.fromJson(String source) =>
      SpecificAttributesMap.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'SpecificAttributesMap(stringAttributes: $stringAttributes, boolAttributes: $boolAttributes, enumAttributes: $enumAttributes)';

  @override
  bool operator ==(covariant SpecificAttributesMap other) {
    if (identical(this, other)) return true;

    return mapEquals(other.stringAttributes, stringAttributes) &&
        mapEquals(other.boolAttributes, boolAttributes) &&
        mapEquals(other.enumAttributes, enumAttributes);
  }

  @override
  int get hashCode =>
      stringAttributes.hashCode ^
      boolAttributes.hashCode ^
      enumAttributes.hashCode;
}
