// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:mca_project/data/models/cart.dart';

import 'basic_user_model/basic_user_model.dart';

//UserModel is used to check user-type during app startup
abstract class UserModel {}

class Customer extends UserModel {
  final int? id;

  List<CartItem>? cartItems;
  BasicUserModel user;
  Customer({
    required this.user,
    this.cartItems,
    this.id,
  });

  Customer copyWith({
    BasicUserModel? user,
    List<CartItem>? cartItems,
  }) {
    return Customer(
      user: user ?? this.user,
      cartItems: cartItems ?? this.cartItems,
      id: this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'myUser': user.toJson(),
      'cartItems': cartItems?.map((cartItem) => cartItem.toMap()).toList(),
    };
  }

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
        id: map['id'] != null ? map['id'] as int : null,
        user: BasicUserModel.fromJson(map['myUser'] as Map<String, dynamic>),
        cartItems: map['cartItems'] == null
            ? null
            : List<CartItem>.from(
                (map['cartItems'] as List<dynamic>).map<CartItem>(
                  (x) => CartItem.fromMap(x as Map<String, dynamic>),
                ),
              ));
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
