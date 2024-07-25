import 'dart:developer';

import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:mca_project/data/models/shop_model/shop_model1.dart';

import '../../../services/geo_locator_service.dart';
import '/services/cloudinary_service.dart';

import '../../../services/api_service.dart';
import '../../../utils/exceptions/custom_exception.dart';
import '../../models/category/category_data.dart';
import '../../models/product.dart';

class ShopDataRepository {
  ShopModel1? shopModel;
  // ShopModel1? shopModel1;
  LocationInfo? locationInfo;
  List<CategoryData> categoriesData = [];
  // List<ProductCategory> productCategories = [];

  ShopDataRepository({this.shopModel});

  void setShopModel(ShopModel1? shopModel) => this.shopModel = shopModel;

  Future<void> registerShop(ShopModel1 shopModel) async {
    try {
      final newShopModel = shopModel.copyWith(
        ownerIdPicUrl:
            await CloudinaryService.uploadImage(shopModel.ownerIdPicUrl),
        shopPicUrl: await CloudinaryService.uploadImage(shopModel.shopPicUrl),
        pancardPicUrl:
            await CloudinaryService.uploadImage(shopModel.pancardPicUrl),
        ownerPicUrl: await CloudinaryService.uploadImage(shopModel.ownerPicUrl),
      );
      await ApiService.registerShop(newShopModel);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> loginShop(String email, String password) async {
    try {
      await ApiService.loginShop(email, password);
      final shModel = await ApiService.getUserModel() as ShopModel1?;
      if (shModel == null) {
        throw CustomException(
            errorType: ErrorType.unknown,
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
            errorType: ErrorType.internetConnection,
            message:
                'Something went wrong! Please check your internet connection.');
      }

      categoriesData = response;
      //need these at shop registration
      // for (CategoryData category in categoriesData) {
      //   productCategories.add(ProductCategory(
      //       description: '',
      //       image: category.image,
      //       name: category.name,
      //       isTopProductCategory: false));
      // }
    } catch (e) {
      log("loadAllCategories error: $e");
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

  Future<String> getLocationAddress(String? userEnteredLocation) async {
    try {
      late List<geocoding.Placemark> _placemarks;
      late double _latitude;
      late double _longtitude;
      if (userEnteredLocation == null) {
        //position from current location
        final position = await GeoLocatorService.getcurrentPosition();
        if (position == null) {
          throw CustomException(
            errorType: ErrorType.unknown,
            message: 'Something went wrong!,Please try agian',
          );
        }
        _placemarks = await geocoding.placemarkFromCoordinates(
            position.latitude, position.longitude);
        _latitude = position.latitude;
        _longtitude = position.longitude;
      } else {
//positon from the user entered address
        List<geocoding.Location> locations =
            await geocoding.locationFromAddress(userEnteredLocation);
        //to do: later pass all the location to the function
        //placemarkFromCoordinates to get all the placemarks
        //and let user choose the one he wants
        _placemarks = await geocoding.placemarkFromCoordinates(
            locations[0].latitude, locations[0].longitude);
        _longtitude = locations[0].longitude;
        _latitude = locations[0].latitude;
      }
      final shortAddress =

          // ${_placemarks[0].name},
          '${_placemarks[0].street},${_placemarks[0].locality},${_placemarks[0].postalCode} ${_placemarks[0].country}';
      locationInfo = LocationInfo(
          completeAddress:
              '${_placemarks[0].name}, ${_placemarks[0].street}, ${_placemarks[0].subLocality}, ${_placemarks[0].locality}, ${_placemarks[0].administrativeArea}, ${_placemarks[0].postalCode}, ${_placemarks[0].country}',
          shortAddress: shortAddress,
          latitude: _latitude,
          longtitude: _longtitude);
      return shortAddress;
    } catch (e) {
      rethrow;
    }
  }
}
