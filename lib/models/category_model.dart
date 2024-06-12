import 'package:mca_project/models/product_model.dart';

class Category {
  String name;
  String image;
  bool isTopCategory;
  List<ProductModel> products;
  Category(
      {required this.name,
      required this.image,
      required this.isTopCategory,
      required this.products});
}
