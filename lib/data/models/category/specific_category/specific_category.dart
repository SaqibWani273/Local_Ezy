import 'package:json_annotation/json_annotation.dart';

import '../../product.dart';
part 'specific_category.g.dart';

@JsonSerializable()
class SpecificCategory {
  final String name;
  SpecificCategory({
    required this.name,
  });

  factory SpecificCategory.fromJson(Map<String, Object?> json) =>
      _$SpecificCategoryFromJson(json);
  Map<String, Object?> toJson() => _$SpecificCategoryToJson(this);
}
