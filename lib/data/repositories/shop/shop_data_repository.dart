import 'package:mca_project/data/models/shop_model.dart';

import '../../../services/api_service.dart';

class ShopDataRepository {
  ShopModel? shopModel;

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
}
