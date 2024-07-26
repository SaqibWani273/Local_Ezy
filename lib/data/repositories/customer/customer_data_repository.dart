import 'dart:developer';

import 'package:mca_project/data/models/shop_model/shop_model1.dart';
import 'package:mca_project/services/api_service.dart';

import '../../../services/geo_locator_service.dart';
import '../../models/category/product_category/product_category.dart';
import '/data/models/product.dart';

class CustomerDataRepository {
  List<Product>? _products;
  List<ProductCategory>? _categories;
  LocationInfo? currentSelectedLocation;
  List<ShopModel1>? _shops;
  List<ShopModel1>? get getShops => _shops;
  List<ProductCategory>? get getCategories => _categories;
  List<Product>? get getProducts => _products;

  Future<void> fetchData() async {
    try {
      //fetch and update current location
      currentSelectedLocation = await GeoLocatorService.fetchLocationInfo(null);
      //fetch shop-data from server
//fetch products
      _products = await ApiService.fetchProducts();
      //fetch categories
    } catch (e) {
      log("Error fetching products data from server-> $e");
      rethrow;
    }
  }

  Future<void> changeCurrentLocation(String? location) async {
    try {
      if (location == null) {
        //user wants to set location to global
        currentSelectedLocation = null;
        return;
      }
      if (location == 'current') //hardcoded string
      {
        //user wants to set location to current
        currentSelectedLocation =
            await GeoLocatorService.fetchLocationInfo(null);
        return;
      }
      currentSelectedLocation =
          await GeoLocatorService.fetchLocationInfo(location);
    } catch (e) {
      log("Error Changing current location-> $e");
      rethrow;
    }
  }
}
