part of 'shop_bloc.dart';

abstract class ShopState {}

class ShopInitialState extends ShopState {}

class ShopLoadingState extends ShopState {}

class ShopLoadedAllCategoriesState extends ShopState {}

class ShopUploadedProductState extends ShopState {}

class ShopErrorState extends ShopState {
  final String error;
  ShopErrorState({required this.error});
}

class ShopUploadedMultipleImagesState extends ShopState {
  List<String> images;

  ShopUploadedMultipleImagesState({required this.images});
}
