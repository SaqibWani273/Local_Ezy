import 'dart:developer';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mca_project/utils/exceptions/customer_exception.dart';
import 'package:mca_project/utils/functions/secure_storage.dart';

import '../../models/customer.dart';

class CustomerProfileService {
  static const String baseApiUrl = 'http://10.0.2.2:8080/customer';

  Future<void> registerCustomer(
      String name, String email, String password) async {
    try {
      final response = await http.post(Uri.parse('$baseApiUrl/register'),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(
              {'username': name, 'email': email, 'password': password}));
      if (response.statusCode == 400) {
        log(response.body);
        throw CustomerException(response.body);
      }
      if (response.statusCode != 200) {
        log(response.body);
        throw CustomerException(
            'Something went wrong! Please check your internet connection.');
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<void> loginCustomer(String email, String password) async {
    try {
      final response = await http.post(Uri.parse('$baseApiUrl/login'),
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
    final token = await SecureStorage.getToken();
    if (token == null || token.isEmpty) {
      return null;
    }

    final response = await http.post(
      Uri.parse('$baseApiUrl/me'),
      headers: {"Authorization": "Bearer $token"},
      body: token,
    );
    if (response.statusCode == 200) {
      return Customer.fromJson(response.body);
    } else if (response.statusCode == 401) {
      //token expired
      await SecureStorage.deleteToken();
      return null;
    } else {
      log("${response.statusCode} -> ${response.body}");
      throw CustomerException(
          'Something went wrong! Please check your internet connection.');
    }
  }

  Future<void> logoutCustomer() async {
    await SecureStorage.deleteToken();
  }
}
