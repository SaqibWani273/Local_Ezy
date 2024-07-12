part of 'shop_auth_bloc.dart';

abstract class ShopAuthState {}

class ShopAuthInitialState extends ShopAuthState {}

class ShopAuthLoadingState extends ShopAuthState {}

class ShopAuthLoggedInState extends ShopAuthState {}

class ShopAuthEmailSentState extends ShopAuthState {}

class ShopAuthErrorState extends ShopAuthState {
  final String message;

  ShopAuthErrorState(this.message);
}
