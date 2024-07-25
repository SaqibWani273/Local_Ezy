import 'package:flutter/foundation.dart';

String baseApiUrl = 'http://${getHostname()}:8080';
// String baseApiUrl = 'http://3.111.169.191';
final String baseCustomerUrl = '$baseApiUrl/customer';
final String customerLoginUrl = '$baseCustomerUrl/login';
final String customerRegisterUrl = '$baseCustomerUrl/register';
final String userProfileUrl = '$baseApiUrl/user/me';
final String shopRegistrationUrl = '$baseApiUrl/shop/register';
final String shopLoginUrl = '$baseApiUrl/shop/login';
final String uploadProductUrl = '$baseApiUrl/shop/add-product';
final String loadAllCategoriesUrl = '$baseApiUrl/user/get-all-categories';
final myIpAddress = '192.168.1.5'; //use ipconfig in cmd

class CloudinaryApiConst {
  static String cloudinaryImageUploadUrl =
      'https://api.cloudinary.com/v1_1/dtemdwygc/image/upload';
  static const String cloudinaryApiKey = '727715155817234';
}

String getHostname() {
  if (!kIsWeb) {
    return myIpAddress;
  }
  return 'localhost';
}
