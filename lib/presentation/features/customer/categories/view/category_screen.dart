import 'package:flutter/material.dart';
import '../../../../../data/models/category/product_category.dart';

class CategoryScreen extends StatelessWidget {
  final ProductCategory category;
  const CategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Text(category.name)),
      ),
    );
  }
}
