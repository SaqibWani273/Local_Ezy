// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryData _$CategoryDataFromJson(Map<String, dynamic> json) => CategoryData(
      name: json['name'] as String,
      image: json['image'] as String,
      mustFields: json['mustFields'] == null
          ? null
          : CategoryFields.fromJson(json['mustFields'] as Map<String, dynamic>),
      optionalFields: json['optionalFields'] == null
          ? null
          : CategoryFields.fromJson(
              json['optionalFields'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoryDataToJson(CategoryData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'mustFields': instance.mustFields,
      'optionalFields': instance.optionalFields,
    };

CategoryFields _$CategoryFieldsFromJson(Map<String, dynamic> json) =>
    CategoryFields(
      stringAttributes: (json['stringAttributes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      boolAttributes: (json['boolAttributes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      enumAttributes: (json['enumAttributes'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
    );

Map<String, dynamic> _$CategoryFieldsToJson(CategoryFields instance) =>
    <String, dynamic>{
      'stringAttributes': instance.stringAttributes,
      'boolAttributes': instance.boolAttributes,
      'enumAttributes': instance.enumAttributes,
    };
