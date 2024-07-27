// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'basic_user_model/basic_user_model.dart';

//UserModel is used to check user-type during app startup
abstract class UserModel {}

class Customer extends UserModel {
  BasicUserModel user;
  Customer({
    required this.user,
  });

  Customer copyWith({
    BasicUserModel? user,
  }) {
    return Customer(
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'myUser': user.toJson(),
    };
  }

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      user: BasicUserModel.fromJson(map['myUser'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Customer.fromJson(String source) =>
      Customer.fromMap(json.decode(source) as Map<String, dynamic>);

  // @override
  // String toString() => 'Customer(user: $user)';

  // @override
  // bool operator ==(covariant Customer other) {
  //   if (identical(this, other)) return true;

  //   return other.user == user;
  // }

  // @override
  // int get hashCode => user.hashCode;
}
