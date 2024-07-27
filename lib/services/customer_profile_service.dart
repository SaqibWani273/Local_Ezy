import 'dart:developer';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mca_project/constants/rest_api_const.dart';
import '/utils/exceptions/customer_exception.dart';
import '/utils/secure_storage.dart';

import '../data/models/customer.dart';

class CustomerProfileService {
  // static const String baseApiUrl = 'http://10.0.2.2:8080/customer';

  Future<void> registerCustomer(
      String name, String email, String password) async {
    try {
      final response = await http.post(Uri.parse(ApiConst.customerRegisterUrl),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(
              {'username': name, 'email': email, 'password': password}));
      if (response.statusCode == 400) {
        log(response.body);
        throw CustomerException("Status Code 400: " + response.body);
      }
      if (response.statusCode != 200) {
        log(response.body);
        throw CustomerException(
            'Something went wrong!,Error code: ${response.statusCode}');
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<void> loginCustomer(String email, String password) async {
    try {
      final response = await http.post(Uri.parse(ApiConst.customerLoginUrl),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({'email': email, 'password': password}));
      if (response.statusCode == 400) {
        log(response.body);
        throw CustomerException(response.body);
      }
      if (response.statusCode != 200) {
        log("${response.statusCode} -> ${response.body}");
        throw CustomerException(
            'Something went wrong! Please check your internet connection.');
      }
      log("token-> ${response.body}");
      await SecureStorage.storeToken(response.body);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<Customer?> isCustomerLoggedIn() async {
    try {
      final token = await SecureStorage.getToken();
      if (token == null || token.isEmpty) {
        return null;
      }

      final response = await http.post(
        Uri.parse(ApiConst.customerProfileUrl),
        headers: {"Authorization": "Bearer $token"},
        body: token,
      );
      if (response.statusCode == 200) {
        return Customer.fromJson(response.body);
      } else if (response.statusCode == 401) {
        //token expired or of different role
        await SecureStorage.deleteToken();
        throw CustomerException('Not Valid Credentials');
      } else {
        log("${response.statusCode} -> ${response.body}");
        throw CustomerException(
            'onternal error, ${response.statusCode} -> ${response.body}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logoutCustomer() async {
    await SecureStorage.deleteToken();
  }
}
