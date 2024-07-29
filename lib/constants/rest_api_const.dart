import 'package:flutter/foundation.dart';

class ApiConst {
  static String baseApiUrl = 'http://${getHostname()}:8080';
  // static final String baseApiUrl = 'http://3.111.169.191';
  static final String baseCustomerUrl = '$baseApiUrl/customer';
  static final String customerLoginUrl = '$baseCustomerUrl/login';
  static final String customerRegisterUrl = '$baseCustomerUrl/register';
  static final String userProfileUrl = '$baseApiUrl/user/me';
  static final String customerProfileUrl = '$baseApiUrl/customer/me';
  static final String shopRegistrationUrl = '$baseApiUrl/shop/register';
  static final String shopLoginUrl = '$baseApiUrl/shop/login';
  static final String uploadProductUrl = '$baseApiUrl/shop/add-product';
  // static final String updateCustomerUrl = '$baseApiUrl/customer/update';
  static final String updateCartUrl = '$baseApiUrl/customer/update-cart-items';
  static final String loadAllCategoriesUrl =
      '$baseApiUrl/user/get-all-categories';
  static final String fetchProductsByIdsUrl =
      '$baseApiUrl/customer/get-products-by-ids';
  static final String usernameExistsUrl = '$baseApiUrl/user/username-exists';
  static final String emailExistsUrl = '$baseApiUrl/user/email-exists';
  static final fetchProductUrl = '$baseApiUrl/customer/get-all-products';
  static final myIpAddress = '192.168.1.5'; //use ipconfig in cmd
}

class CloudinaryApiConst {
  static String cloudinaryImageUploadUrl =
      'https://api.cloudinary.com/v1_1/dtemdwygc/image/upload';
  static const String cloudinaryApiKey = '727715155817234';
}

String getHostname() {
  if (!kIsWeb) {
    return ApiConst.myIpAddress;
  }
  return 'localhost';
}
