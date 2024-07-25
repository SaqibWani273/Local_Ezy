// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';
part 'basic_user_model.g.dart';

@JsonSerializable()
class BasicUserModel {
  String username;
  String password;
  String email;
  BasicUserModel({
    required this.username,
    required this.password,
    required this.email,
  });

  factory BasicUserModel.fromJson(Map<String, dynamic> json) =>
      _$BasicUserModelFromJson(json);
  Map<String, dynamic> toJson() => _$BasicUserModelToJson(this);
}
