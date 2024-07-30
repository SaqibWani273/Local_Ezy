import 'dart:developer';

import '/data/models/cart.dart';
import '/data/models/shop_model/shop_model1.dart';
import '/services/api_service.dart';

import '../../../services/customer_profile_service.dart';
import '../../../services/geo_locator_service.dart';
import '../../../utils/utils.dart';
import '../../models/category/product_category/product_category.dart';
import '../../models/customer.dart';
import '/data/models/product.dart';

class CustomerDataRepository {
  List<Product> products = [];
  List<ProductCategory>? categories;
  LocationInfo? currentSelectedLocation;
  // List<ShopModel1>? _shops;
  // List<ShopModel1>? get getShops => _shops;
  // List<ProductCategory>? get getCategories => _categories;
  // List<Product>? get getProducts => _products;
  Customer? customer;
  List<CartItemDetails> cartItemDetails = [];
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

  Future<void> fetchProducts() async {
    try {
      //fetch products
      products = await ApiService.fetchProducts(currentSelectedLocation);
      //fetch categories
    } catch (e) {
      log("Error fetching products data from server-> $e");
      rethrow;
    }
  }

  Future<void> fetchLocation(String? location) async {
    try {
      if (location == 'global') {
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
      //update locally
      customer = customer!.copyWith(
        cartItems: await Utils.addToCart(
            product: product, cartItems: customer!.cartItems),
      );
      final x = await CustomerProfileService.fetchProductsFromIds(
          [CartItem(productId: product.id!, quantity: 1)]);
      cartItemDetails.add(x.first);
      //update at server
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
      cartItemDetails.removeWhere(
        (element) => element.product.id == product.id,
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
      cartItemDetails
          .firstWhere((element) => element.product.id == product.id)
          .quantity += 1;

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
      cartItemDetails
          .firstWhere((element) => element.product.id == product.id)
          .quantity -= 1;

      await CustomerProfileService.updateCartItems(
          customerId: customer!.id!, cartItems: customer!.cartItems!);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> fetchMultipleCartItemDetails(List<CartItem> cartItems) async {
    try {
      //here we fetch the products from their ids
      cartItemDetails =
          await CustomerProfileService.fetchProductsFromIds(cartItems);
    } catch (e) {
      rethrow;
    }
  }
}
