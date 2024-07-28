import 'dart:developer';

import 'package:mca_project/data/models/shop_model/shop_model1.dart';
import 'package:mca_project/services/api_service.dart';

import '../../../services/customer_profile_service.dart';
import '../../../services/geo_locator_service.dart';
import '../../../utils/utils.dart';
import '../../models/category/product_category/product_category.dart';
import '../../models/customer.dart';
import '/data/models/product.dart';

class CustomerDataRepository {
  List<Product>? _products;
  List<ProductCategory>? _categories;
  LocationInfo? currentSelectedLocation;
  List<ShopModel1>? _shops;
  List<ShopModel1>? get getShops => _shops;
  List<ProductCategory>? get getCategories => _categories;
  List<Product>? get getProducts => _products;
  Customer? customer;
  CustomerDataRepository({
    this.customer,
  });
  // set customer(Customer? customer) => _customer = customer;
  // Customer? get customer => _customer;

  Future<void> registerCustomer(
      String name, String email, String password) async {
    try {
      await CustomerProfileService().registerCustomer(name, email, password);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> loginCustomer(String email, String password) async {
    try {
      await CustomerProfileService().loginCustomer(email, password);
      await isCustomerLoggedIn();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> isCustomerLoggedIn() async {
    try {
      customer = await CustomerProfileService().isCustomerLoggedIn();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logoutCustomer() async {
    await CustomerProfileService().logoutCustomer();
    customer = null;
  }

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

  Future<void> addToCart(Product product) async {
    try {
      //update cart locally
      customer = customer!.copyWith(
        cartItems: await Utils.addToCart(
            product: product, cartItems: customer!.cartItems),
      );
      await CustomerProfileService.updateCartItems(
          customerId: customer!.id!, cartItems: customer!.cartItems!);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> removeFromCart(Product product) async {
    try {
      //update cart locally
      customer = customer!.copyWith(
        cartItems: await Utils.removeFromCart(
            product: product, cartItems: customer!.cartItems!),
      );

      await CustomerProfileService.updateCartItems(
          customerId: customer!.id!, cartItems: customer!.cartItems!);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> increaseQuantityByOne(Product product) async {
    try {
      //update cart locally
      customer = customer!.copyWith(
        cartItems: await Utils.increaseQuantityByOne(
            product: product, cartItems: customer!.cartItems!),
      );
      await CustomerProfileService.updateCartItems(
          customerId: customer!.id!, cartItems: customer!.cartItems!);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> decreaseQuantityByOne(Product product) async {
    try {
      //update cart locally
      customer = customer!.copyWith(
        cartItems: await Utils.decreaseQuantityByOne(
            product: product, cartItems: customer!.cartItems!),
      );
      await CustomerProfileService.updateCartItems(
          customerId: customer!.id!, cartItems: customer!.cartItems!);
    } catch (e) {
      rethrow;
    }
  }
}
