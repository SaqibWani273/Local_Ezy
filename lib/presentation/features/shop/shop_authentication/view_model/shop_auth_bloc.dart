import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import '/data/repositories/shop/shop_data_repository.dart';
import '/utils/exceptions/custom_exception.dart';
import '../../../../../data/models/shop_model.dart';

part 'shop_auth_event.dart';
part 'shop_auth_State.dart';

class ShopAuthBloc extends Bloc<ShopAuthEvent, ShopAuthState> {
  final ShopDataRepository shopDataRepository;

  ShopAuthBloc({required this.shopDataRepository})
      : super(ShopAuthInitialState()) {
    on<ShopAuthLoginEvent>(shopAuthLoginEvent);
    on<ShopAuthRegisterEvent>(shopAuthRegisterEvent);
    on<ShopAuthLogoutEvent>(shopAuthLogoutEvent);
    on<ShopAuthInitialEvent>(shopAuthInitialEvent);
  }
  Future<void> _handleEvent(
      ShopAuthEvent event, Emitter<ShopAuthState> emit) async {
    emit(ShopAuthLoadingState());
    try {
      switch (event) {
        case ShopAuthInitialEvent _:
          emit(ShopAuthInitialState());
          break;
        case ShopAuthLoginEvent loginEvent:
          await shopDataRepository.loginShop(
              loginEvent.email, loginEvent.password);
          emit(ShopAuthLoggedInState());
          break;
        case ShopAuthRegisterEvent registerEvent:
          await shopDataRepository.registerShop(registerEvent.shopModel);
          emit(ShopAuthEmailSentState());
          break;
        case ShopAuthLogoutEvent _:
          await shopDataRepository.logoutShop();
          emit(ShopAuthLoggedOutState());
          break;
      }
    } on CustomException catch (e) {
      emit(ShopAuthErrorState(e.message));
    } catch (error) {
      log("error in ShopAuthBloc: $error");
      emit(ShopAuthErrorState("Unknown error occurred !!! "));
    }
  }

  void shopAuthInitialEvent(
          ShopAuthInitialEvent event, Emitter<ShopAuthState> emit) =>
      _handleEvent(event, emit);
  void shopAuthLoginEvent(
          ShopAuthLoginEvent loginEvent, Emitter<ShopAuthState> emit) =>
      _handleEvent(loginEvent, emit);

  void shopAuthRegisterEvent(
          ShopAuthRegisterEvent registerEvent, Emitter<ShopAuthState> emit) =>
      _handleEvent(registerEvent, emit);

  void shopAuthLogoutEvent(
          ShopAuthLogoutEvent _, Emitter<ShopAuthState> emit) =>
      _handleEvent(_, emit);
}
