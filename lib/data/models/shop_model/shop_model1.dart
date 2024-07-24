// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:mca_project/data/models/shop_model.dart';

import '../basic_user_model/basic_user_model.dart';
import '../category/product_category/product_category.dart';
import '../customer.dart';

part 'shop_model1.g.dart';

@JsonSerializable()
class ShopModel1 extends UserModel {
  int? id;
  BasicUserModel user;
  String description;
  List<ProductCategory> categories;
  String ownerPicUrl;
  AddressInfo addressInfo;
  String ownerName;
  String shopPicUrl;
  String pancardPicUrl;
  String ownerIdPicUrl;
  String businessLicense;
  int phoneNumber;
  ShopModel1({
    this.id,
    required this.user,
    required this.description,
    required this.categories,
    required this.ownerPicUrl,
    required this.addressInfo,
    required this.ownerName,
    required this.shopPicUrl,
    required this.pancardPicUrl,
    required this.ownerIdPicUrl,
    required this.businessLicense,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() => _$ShopModel1ToJson(this);
  factory ShopModel1.fromJson(Map<String, dynamic> json) =>
      _$ShopModel1FromJson(json);
}

@JsonSerializable()
class AddressInfo {
  final String completeAddress;
  final String shortAddress;
  final double latitude;
  final double longtitude;
  AddressInfo({
    required this.completeAddress,
    required this.shortAddress,
    required this.latitude,
    required this.longtitude,
  });

  Map<String, dynamic> toJson() => _$AddressInfoToJson(this);

  factory AddressInfo.fromJson(Map<String, dynamic> json) =>
      _$AddressInfoFromJson(json);
}
