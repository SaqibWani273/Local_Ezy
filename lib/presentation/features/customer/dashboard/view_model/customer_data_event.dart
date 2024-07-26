part of 'customer_data_bloc.dart';

abstract class CustomerDataEvent {}

class LoadCustomerDataEvent extends CustomerDataEvent {}

class ChangeCustomerCurrentLocationEvent extends CustomerDataEvent {
  final String? currentLocation;
  ChangeCustomerCurrentLocationEvent({required this.currentLocation});
}
