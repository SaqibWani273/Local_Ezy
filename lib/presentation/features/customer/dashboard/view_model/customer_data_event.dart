part of 'customer_data_bloc.dart';

abstract class CustomerDataEvent {}

class LoadCustomerDataEvent extends CustomerDataEvent {}

class ChangeCustomerCurrentLocationEvent extends CustomerDataEvent {
  final String? currentLocation;
  ChangeCustomerCurrentLocationEvent({required this.currentLocation});
}

class CustomerDataAddProductToCartEvent extends CustomerDataEvent {
  final Product product;
  CustomerDataAddProductToCartEvent({required this.product});
}

class CustomerDataRemoveProductFromCartEvent extends CustomerDataEvent {
  final Product product;
  CustomerDataRemoveProductFromCartEvent({required this.product});
}

class CustomerDataIncreaseQuantityByOneEvent extends CustomerDataEvent {
  final Product product;
  CustomerDataIncreaseQuantityByOneEvent({required this.product});
}

class CustomerDataDecreaseQuantityByOneEvent extends CustomerDataEvent {
  final Product product;
  CustomerDataDecreaseQuantityByOneEvent({required this.product});
}
