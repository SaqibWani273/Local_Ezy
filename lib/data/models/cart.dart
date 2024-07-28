// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:mca_project/data/models/product.dart';

// class Cart {
//   final List<CartItem> cartItems;

//   Cart({required this.cartItems});
//   factory Cart.fromMap(Map<String, dynamic> map) {
//     return Cart(
//       cartItems: List<CartItem>.from(
//         (map['cartItems'] as List<int>).map<CartItem>(
//           (x) => CartItem.fromMap(x as Map<String, dynamic>),
//         ),
//       ),
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'cartItems': cartItems.map((x) => x.toMap()).toList(),
//     };
//   }

//   String toJson() => json.encode(toMap());

//   factory Cart.fromJson(String source) =>
//       Cart.fromMap(json.decode(source) as Map<String, dynamic>);
// }

class CartItem {
  final int? id;
  final Product product;
  int quantity;

  CartItem({required this.product, required this.quantity, this.id});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'product': product.toJson(),
      'quantity': quantity,
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      id: map['id'] != null ? map['id'] as int : null,
      product: Product.fromJson(map['product'] as Map<String, dynamic>),
      quantity: map['quantity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartItem.fromJson(String source) =>
      CartItem.fromMap(json.decode(source) as Map<String, dynamic>);
}
