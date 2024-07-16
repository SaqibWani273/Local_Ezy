import 'package:mca_project/data/models/category/product_category.dart';
import 'package:mca_project/data/models/shop_model.dart';
import 'package:mca_project/presentation/features/shop/product_upload/upload_product_screen.dart';

import '../../../services/api_service.dart';
import '../../../utils/exceptions/custom_exception.dart';
import '../../models/category/category_data.dart';

class ShopDataRepository {
  ShopModel? shopModel;
  List<CategoryData> categoriesData = [];

  ShopDataRepository({this.shopModel});

  void setShopModel(ShopModel? shopModel) => this.shopModel = shopModel;

  Future<void> registerShop(ShopModel shopModel) async {
    try {
      await ApiService.registerShop(shopModel);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> loginShop(String email, String password) async {
    try {
      await ApiService.loginShop(email, password);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logoutShop() async {
    try {
      await ApiService.logoutShop();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> loadAllCategories() async {
    try {
      final List<CategoryData>? response = await ApiService.loadAllCategories();
      if (response == null) {
        throw CustomException(
            message:
                'Something went wrong! Please check your internet connection.');
      }

      categoriesData = response;
    } catch (e) {
      rethrow;
    }
  }
}
