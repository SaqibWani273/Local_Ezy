import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import '/services/api_service.dart';

import '../data/models/customer.dart';

class NoInternetModel extends UserModel {}

Future<UserModel?> mainAsyncTasks() async {
  // await Future.delayed(const Duration(seconds: 3));
  //check internet
  if (await hasInternet()) {
    final userModel = await ApiService.getUserModel();

    return userModel;
  } else {
    return NoInternetModel();
  }
}

// enum UserStatus { loggedInAsCustomer, loggedInAsShop, notLoggedIn, noInternet }

Future<bool> hasInternet() async {
  //check if user has internet connection
  final connectivityResult = await Connectivity().checkConnectivity();
  if (connectivityResult.contains(ConnectivityResult.mobile) ||
      connectivityResult.contains(ConnectivityResult.wifi) ||
      connectivityResult.contains(ConnectivityResult.ethernet)) {
    return true;
  }

  return false;
}
