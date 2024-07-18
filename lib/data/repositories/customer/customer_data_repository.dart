import '/data/models/category/product_category.dart';
import '/data/models/product.dart';
import '/data/models/shop_model.dart';

class CustomerDataRepository {
  List<Product>? _products;
  List<ProductCategory>? _categories;
  List<ShopModel>? _shops;
  List<ShopModel>? get getShops => _shops;
  List<ProductCategory>? get getCategories => _categories;
  List<Product>? get getProducts => _products;

  Future<void> setData() async {
//fetch shop-data from server
  }
}
