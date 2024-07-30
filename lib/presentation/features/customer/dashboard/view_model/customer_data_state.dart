part of 'customer_data_bloc.dart';

abstract class CustomerDataState {}

class CustomerDataInitialState extends CustomerDataState {}

class CustomerDataLoadingState extends CustomerDataState {}

class CustomerDataChangingCurrentLocationState extends CustomerDataState {}

class CustomerDataLoadedState extends CustomerDataState {
  bool? isChangingLocation;
  bool? loadingProducts;
  CustomerDataLoadedState({this.isChangingLocation, this.loadingProducts});
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

class CustomerDataLocationErrorState extends CustomerDataState {
  final CustomException error;
  CustomerDataLocationErrorState({required this.error});
}
