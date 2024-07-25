import 'dart:convert';
import 'dart:developer';

import 'package:mca_project/data/models/shop_model/shop_model1.dart';

import '/constants/rest_api_const.dart';
import '/utils/exceptions/custom_exception.dart';

import '../data/models/category/category_data.dart';
import '../data/models/customer.dart';
import '../data/models/product.dart';
import '../utils/secure_storage.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<UserModel?> getUserModel() async {
    try {
      final token = await SecureStorage.getToken();
      if (token == null || token.isEmpty) {
        //not logged in
        return null;
      }

      final response = await http.post(
        Uri.parse(userProfileUrl),
        headers: {"Authorization": "Bearer $token"},
        body: token,
      );

      if (response.statusCode == 200) {
        /* expected json response
       '{
         'role': 'customer',
         'model': {
           customer details....
                  }
        }'
                  or


        '{
         'role': 'shop',
         'model': {
           shop details.....
                  }
        }'
        
                  */
        if (response.body.isNotEmpty) {
          final decodedResponse = jsonDecode(response.body);
          if (decodedResponse['role'] == Roles.ROLE_CUSTOMER.name) {
            return Customer.fromMap(decodedResponse['model']);
          }
          return ShopModel1.fromJson(decodedResponse['model']);
        }
        //server did not return any data
        log("Server did not return any data--> ${response.body}");
        return null;
      } else if (response.statusCode == 401) {
        //token expired
        await SecureStorage.deleteToken();
        //not logged in
        return null;
      } else {
        log("${response.statusCode} -> ${response.body}");
        return null;
      }
    } catch (e) {
      log("getUserModel error: $e");
      return null;
    }
  }

  static Future<void> registerShop(ShopModel1 shopModel) async {
    try {
      final response = await http.post(Uri.parse(shopRegistrationUrl),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(shopModel.toJson()));
      if (response.statusCode == 200) {
        log(response.body);
      } else {
        log(" error in  registerShop,response-> ${response.body} ${response.statusCode} -> ${response.body}");
        throw CustomException(
            errorType: ErrorType.internetConnection,
            message:
                'Something went wrong! Please check your internet connection.');
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> loginShop(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(shopLoginUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({'email': email, 'password': password}),
      );
      if (response.statusCode == 200) {
        await SecureStorage.storeToken(response.body);
      } else if (response.statusCode == 400) {
        throw CustomException(
            errorType: ErrorType.unknown, message: response.body);
      } else {
        throw CustomException(
            errorType: ErrorType.internetConnection,
            message: " Something went wrong!,${response.statusCode}");
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> logoutShop() async {
    try {
      await SecureStorage.deleteToken();
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<CategoryData>?> loadAllCategories() async {
    try {
      // final token = await SecureStorage.getToken();
      // if (token == null || token.isEmpty) {
      //   //not logged in
      //   return null;
      // }
      final response = await http.get(
        Uri.parse(loadAllCategoriesUrl),
        headers: {
          "Content-Type": "application/json",
          // "Authorization": "Bearer $token"
        },
      );
      if (response.statusCode == 200) {
        var categoriesData = <CategoryData>[];
        for (var element in jsonDecode(response.body)) {
          categoriesData.add(CategoryData.fromJson(element));
        }
        return categoriesData;
      } else {
        throw CustomException(
            errorType: ErrorType.internetConnection,
            message: " Something went wrong!,${response.statusCode}");
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> uploadProduct(Product product) async {
    try {
      final String? token = await SecureStorage.getToken();
      final response = await http.post(Uri.parse(uploadProductUrl),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
          },
          body: jsonEncode(product.toJson()));
      if (response.statusCode != 200) {
        throw CustomException(
            errorType: ErrorType.internetConnection,
            message: " Something went wrong!,${response.statusCode}");
      }
    } catch (e) {
      rethrow;
    }
  }
}

enum Roles { ROLE_CUSTOMER, ROLE_SHOP }
