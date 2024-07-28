import 'package:flutter/material.dart';

import '../data/models/cart.dart';
import '../data/models/product.dart';

class Utils {
  static List<CartItem> addToCart(
      {required Product product, required List<CartItem>? cartItems}) {
    if (cartItems == null) {
      //if cart is null create a new cart
      return [CartItem(product: product, quantity: 1)];
    } else {
      //not null
      //if cart already has this product, increase the quantity
      if (cartItems.any((element) => element.product.id == product.id)) {
        cartItems
            .firstWhere((element) => element.product.id == product.id)
            .quantity += 1;
        return cartItems;
      }
      //IcartItemselse add the product to the cart
      return [...cartItems, CartItem(product: product, quantity: 1)];
    }
  }

  static void showScaffoldMessage({
    required String message,
    BuildContext? context,
    Widget? actionWidget,
  }) {
    ScaffoldMessenger.of(context!).showSnackBar(
      SnackBar(
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Text(message),
              Spacer(),
              if (actionWidget != null) actionWidget
            ],
          ),
        ),
      ),
    );
  }

  static List<CartItem> removeFromCart(
      {required List<CartItem> cartItems, required Product product}) {
    cartItems.removeWhere((element) => element.product.id == product.id);

    return cartItems;
  }

  static List<CartItem> decreaseQuantityByOne(
      {required List<CartItem> cartItems, required Product product}) {
    cartItems
        .firstWhere((element) => element.product.id == product.id)
        .quantity -= 1;
    return cartItems;
  }

  static List<CartItem> increaseQuantityByOne(
      {required List<CartItem> cartItems, required Product product}) {
    cartItems
        .firstWhere((element) => element.product.id == product.id)
        .quantity += 1;
    return cartItems;
  }
}
