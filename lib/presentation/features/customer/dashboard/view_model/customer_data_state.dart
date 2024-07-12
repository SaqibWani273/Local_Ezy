part of 'customer_data_bloc.dart';

abstract class CustomerDataState {}

class CustomerDataInitialState extends CustomerDataState {}

class CustomerDataLoadingState extends CustomerDataState {}

class CustomerDataLoadedState extends CustomerDataState {}

class CustomerDataErrorState extends CustomerDataState {
  final String error;
  CustomerDataErrorState({required this.error});
}
