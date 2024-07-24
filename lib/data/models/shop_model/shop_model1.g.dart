// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_model1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopModel1 _$ShopModel1FromJson(Map<String, dynamic> json) => ShopModel1(
      id: (json['id'] as num?)?.toInt(),
      user: BasicUserModel.fromJson(json['user'] as Map<String, dynamic>),
      description: json['description'] as String,
      categories: (json['categories'] as List<dynamic>)
          .map((e) => ProductCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      ownerPicUrl: json['ownerPicUrl'] as String,
      addressInfo:
          AddressInfo.fromJson(json['addressInfo'] as Map<String, dynamic>),
      ownerName: json['ownerName'] as String,
      shopPicUrl: json['shopPicUrl'] as String,
      pancardPicUrl: json['pancardPicUrl'] as String,
      ownerIdPicUrl: json['ownerIdPicUrl'] as String,
      businessLicense: json['businessLicense'] as String,
      phoneNumber: (json['phoneNumber'] as num).toInt(),
    );

Map<String, dynamic> _$ShopModel1ToJson(ShopModel1 instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'description': instance.description,
      'categories': instance.categories,
      'ownerPicUrl': instance.ownerPicUrl,
      'addressInfo': instance.addressInfo,
      'ownerName': instance.ownerName,
      'shopPicUrl': instance.shopPicUrl,
      'pancardPicUrl': instance.pancardPicUrl,
      'ownerIdPicUrl': instance.ownerIdPicUrl,
      'businessLicense': instance.businessLicense,
      'phoneNumber': instance.phoneNumber,
    };

AddressInfo _$AddressInfoFromJson(Map<String, dynamic> json) => AddressInfo(
      completeAddress: json['completeAddress'] as String,
      shortAddress: json['shortAddress'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longtitude: (json['longtitude'] as num).toDouble(),
    );

Map<String, dynamic> _$AddressInfoToJson(AddressInfo instance) =>
    <String, dynamic>{
      'completeAddress': instance.completeAddress,
      'shortAddress': instance.shortAddress,
      'latitude': instance.latitude,
      'longtitude': instance.longtitude,
    };
