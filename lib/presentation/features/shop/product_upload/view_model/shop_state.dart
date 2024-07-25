part of 'shop_bloc.dart';

abstract class ShopState {}

class ShopInitialState extends ShopState {}

class ShopLoadingState extends ShopState {}

class ShopLoadedAllCategoriesState extends ShopState {}

class ShopUploadedProductState extends ShopState {}

class ShopErrorState extends ShopState {
  final CustomException customException;
  ShopErrorState({required this.customException});
}

class ShopUploadedMultipleImagesState extends ShopState {
  List<String> images;

  ShopUploadedMultipleImagesState({required this.images});
}
