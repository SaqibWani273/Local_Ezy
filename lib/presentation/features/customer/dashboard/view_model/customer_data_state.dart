part of 'customer_data_bloc.dart';

abstract class CustomerDataState {}

class CustomerDataInitialState extends CustomerDataState {}

class CustomerDataLoadingState extends CustomerDataState {}

class CustomerDataChangingCurrentLocationState extends CustomerDataState {}

class CustomerDataLoadedState extends CustomerDataState {
  bool? isChangingLocation;
  CustomerDataLoadedState({this.isChangingLocation});
}

class CustomerDataErrorState extends CustomerDataState {
  final String error;
  CustomerDataErrorState({required this.error});
}

class CustomerDataFetchingCartItemDetailsState extends CustomerDataState {}

class CustomerDataCartErrorState extends CustomerDataState {
  final CustomException error;

  CustomerDataCartErrorState({required this.error});
}

class CustomerDataCartFetchedCartItemDetailsState extends CustomerDataState {}
