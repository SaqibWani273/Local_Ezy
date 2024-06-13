import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final IconData selectedIcon;
  final IconData unSelectedIcon;

  const MenuItem({
    required this.title,
    required this.selectedIcon,
    required this.unSelectedIcon,
  });
}

List<MenuItem> menuItems = [
  MenuItem(
    title: 'Home',
    selectedIcon: Icons.home,
    unSelectedIcon: Icons.home_outlined,
  ),
  MenuItem(
    title: 'Favourites',
    selectedIcon: Icons.favorite,
    unSelectedIcon: Icons.favorite_border_outlined,
  ),
  MenuItem(
    title: 'Special Offers',
    selectedIcon: Icons.card_giftcard_rounded,
    unSelectedIcon: Icons.card_giftcard_outlined,
  ),
  MenuItem(
    title: 'Categories',
    selectedIcon: Icons.category_outlined,
    unSelectedIcon: Icons.category_outlined,
  ),
  MenuItem(
    title: 'Shop',
    selectedIcon: Icons.shop_2_outlined,
    unSelectedIcon: Icons.shop_2_outlined,
  ),
  MenuItem(
    title: 'Your Orders',
    selectedIcon: Icons.list,
    unSelectedIcon: Icons.list_alt_outlined,
  ),
  MenuItem(
    title: 'Cart',
    selectedIcon: Icons.shopping_cart_outlined,
    unSelectedIcon: Icons.shopping_cart_outlined,
  ),
  MenuItem(
    title: 'Profile',
    selectedIcon: Icons.account_circle_rounded,
    unSelectedIcon: Icons.account_circle_outlined,
  ),
  MenuItem(
    title: 'Help & Support',
    selectedIcon: Icons.help_outline_rounded,
    unSelectedIcon: Icons.help_outline_outlined,
  ),
];
// //const List<MenuItem> menuItems = [
//   MenuItem('Featured Shops', Icons.star),
//   MenuItem('All Shops', Icons.store),
//   MenuItem('Favourites', Icons.favorite),
//   MenuItem('Special Offers', Icons.local_offer),
//   MenuItem('Your Orders', Icons.list),
//   MenuItem('Shopping Cart', Icons.shopping_cart),
//   MenuItem('Account Details', Icons.account_circle),
//   MenuItem('Help & Support', Icons.help),
// ];


