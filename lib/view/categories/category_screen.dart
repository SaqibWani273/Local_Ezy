import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mca_project/models/category_model.dart';

class CategoryScreen extends StatelessWidget {
  final Category category;
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
