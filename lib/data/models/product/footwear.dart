import 'package:flutter/material.dart';

import '../category_model.dart';
import 'product_model.dart';

class FootwearProduct implements Product {
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
  final List<Color> colors;
  @override
  final List<ProductReview> reviews;

  @override
  final String shortDescription;
  @override
  final String brand;
  final bool isWaterResistant;
  final bool isLighWeight;
  final Occasion occasion;
  final SoleMaterial soleMaterial;
  final UpperMaterial upperMaterial;
  final ClosureType closureType;

  const FootwearProduct({
    required this.id,
    required this.name,
    required this.images,
    required this.price,
    this.discountInPercentage,
    required this.completeDescription,
    required this.shortDescription,
    required this.brand,
    required this.category,
    required this.shopId,
    required this.stockQuantity,
    required this.colors,
    this.rating,
    required this.isWaterResistant,
    required this.isLighWeight,
    required this.occasion,
    required this.soleMaterial,
    required this.upperMaterial,
    required this.closureType,
    required this.reviews,
  });
}

enum Occasion {
  casual,
  athletic,
  formal,
  work,
  dressyCasual,
  all, // optional value to represent all occasions
}

enum SoleMaterial {
  rubber,
  evaFoam,
  leather,
  plastic,
  other,
}

enum UpperMaterial {
  leather,
  canvas,
  mesh,
  synthetic,
  fabric,
  other,
}

enum ClosureType {
  laces,
  velcro,
  slipOn,
  buckle,
  ankleBoot,
  other,
}
