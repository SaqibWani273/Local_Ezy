import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mca_project/presentation/features/categories/view/categories_screen.dart';
import 'package:mca_project/presentation/features/dashboard/view/dashoard.dart';

class BottomNavbarItem {
  final String label;
  final IconData selectedIcon;
  final IconData unselectedIcon;

  BottomNavbarItem({
    required this.label,
    required this.selectedIcon,
    required this.unselectedIcon,
  });
}

List<BottomNavbarItem> bottomNavbarItems = [
  BottomNavbarItem(
    label: 'Categories',
    selectedIcon: Icons.category_rounded,
    unselectedIcon: Icons.category_outlined,
  ),
  BottomNavbarItem(
    label: 'Shop',
    selectedIcon: Icons.shop_sharp,
    unselectedIcon: Icons.shop_2_outlined,
  ),
  BottomNavbarItem(
    label: 'Home',
    selectedIcon: CupertinoIcons.home,
    unselectedIcon: Icons.home_outlined,
  ),
  BottomNavbarItem(
    label: 'Cart',
    selectedIcon: Icons.shopping_cart_rounded,
    unselectedIcon: Icons.shopping_cart_outlined,
  ),
  BottomNavbarItem(
    label: 'Profile',
    selectedIcon: Icons.person_rounded,
    unselectedIcon: Icons.person_outlined,
  ),
];

List<Widget> mainScreens = [
  const CategoriesScreen(),
  Container(),
  const Dashboard(),
  Container(),
  Container(),
];
