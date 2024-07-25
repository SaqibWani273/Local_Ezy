import 'package:mca_project/data/models/shop_model/shop_model1.dart';

import '../../models/category/product_category/product_category.dart';
import '/data/models/product.dart';

class CustomerDataRepository {
  List<Product>? _products;
  List<ProductCategory>? _categories;
  List<ShopModel1>? _shops;
  List<ShopModel1>? get getShops => _shops;
  List<ProductCategory>? get getCategories => _categories;
  List<Product>? get getProducts => _products;

  Future<void> setData() async {
//fetch shop-data from server
  }
}
