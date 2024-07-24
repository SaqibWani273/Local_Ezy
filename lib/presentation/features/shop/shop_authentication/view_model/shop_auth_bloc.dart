import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mca_project/data/models/shop_model/shop_model1.dart';
import 'package:mca_project/services/geo_locator_service.dart';
import '/data/repositories/shop/shop_data_repository.dart';
import '/utils/exceptions/custom_exception.dart';
import '../../../../../data/models/shop_model.dart';

part 'shop_auth_event.dart';
part 'shop_auth_State.dart';

class ShopAuthBloc extends Bloc<ShopAuthEvent, ShopAuthState> {
  final ShopDataRepository shopDataRepository;

  ShopAuthBloc({required this.shopDataRepository})
      : super(ShopAuthInitialState()) {
    on<ShopAuthLoginEvent>(shopAuthLogin);
    on<ShopAuthRegisterEvent>(shopAuthRegister);
    on<ShopAuthLogoutEvent>(shopAuthLogout);
    on<ShopAuthInitialEvent>(shopAuthInitial);
    on<ShopAuthLoadLocationEvent>(shopAuthLoadLocation);
  }
  Future<void> _handleEvent(
      ShopAuthEvent event, Emitter<ShopAuthState> emit) async {
    if (event is ShopAuthLoadLocationEvent) {
      emit(ShopAuthLoadingLocationState());
    } else {
      emit(ShopAuthLoadingState());
    }

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
        case ShopAuthLoadLocationEvent _:
          await GeoLocatorService.getcurrentPosition();
      }
    } on CustomException catch (e) {
      log("error in ShopAuthBloc: ${e.message}");
      emit(ShopAuthErrorState(e));
    } catch (error) {
      log("error in ShopAuthBloc: $error");
      emit(ShopAuthErrorState(CustomException(
          message: "Unknown Error", errorType: ErrorType.unknown)));
    }
  }

  void shopAuthInitial(
          ShopAuthInitialEvent event, Emitter<ShopAuthState> emit) =>
      _handleEvent(event, emit);
  void shopAuthLogin(
          ShopAuthLoginEvent loginEvent, Emitter<ShopAuthState> emit) =>
      _handleEvent(loginEvent, emit);

  void shopAuthRegister(
          ShopAuthRegisterEvent registerEvent, Emitter<ShopAuthState> emit) =>
      _handleEvent(registerEvent, emit);

  void shopAuthLogout(ShopAuthLogoutEvent _, Emitter<ShopAuthState> emit) =>
      _handleEvent(_, emit);
  void shopAuthLoadLocation(
          ShopAuthLoadLocationEvent _, Emitter<ShopAuthState> emit) =>
      _handleEvent(_, emit);
}
