import 'dart:developer';

import 'package:mca_project/data/repositories/customer/customer_profile_service.dart';

import '../../models/customer.dart';

class CustomerProfileRepository {
  Customer? customer;
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
    customer = await CustomerProfileService().isCustomerLoggedIn();
  }

  Future<void> logoutCustomer() async {
    await CustomerProfileService().logoutCustomer();
    customer = null;
  }
}
