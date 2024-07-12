part of 'shop_auth_bloc.dart';

abstract class ShopAuthEvent {}

class ShopAuthInitialEvent extends ShopAuthEvent {}

class ShopAuthLoginEvent extends ShopAuthEvent {
  final String email;
  final String password;
  ShopAuthLoginEvent(this.email, this.password);
}

class ShopAuthRegisterEvent extends ShopAuthEvent {
  final ShopModel shopModel;

  ShopAuthRegisterEvent(this.shopModel);
}

class ShopAuthLogoutEvent extends ShopAuthEvent {}
