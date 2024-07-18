import '/data/models/category/product_category.dart';
import '/data/models/shop_model.dart';
import '../../../presentation/features/shop/product_upload/view/upload_product_screen.dart';
import '/services/cloudinary_service.dart';

import '../../../services/api_service.dart';
import '../../../utils/exceptions/custom_exception.dart';
import '../../models/category/category_data.dart';
import '../../models/product.dart';

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
      final shModel = await ApiService.getUserModel() as ShopModel?;
      if (shModel == null) {
        throw CustomException(
            message: "Error Fetching Shop Data.Please try again!");
      }
      shopModel = shModel;
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

  Future<void> uploadProduct(Product product, List<Object> images) async {
    try {
      final List<String> imagesUrl =
          await CloudinaryService.uploadMultipleImages(images);
      product.setImages = imagesUrl;
      await ApiService.uploadProduct(product);
    } catch (e) {
      rethrow;
    }
  }
}
