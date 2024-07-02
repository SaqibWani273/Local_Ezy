import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:mca_project/data/repositories/customer/customer_profile_repository.dart';
import 'package:mca_project/utils/exceptions/customer_exception.dart';

import '../../../../../utils/constants/rest_api_const.dart';
part 'customer_auth_event.dart';
part 'customer_auth_state.dart';

class CustomerAuthBloc extends Bloc<CustomerAuthEvent, CustomerAuthState> {
  final CustomerProfileRepository customerProfileRepository;

  CustomerAuthBloc({required this.customerProfileRepository})
      : super(CustomerAuthInitial()) {
    on<CustomerAuthInitialEvent>(customerAuthInitialEvent);
    on<CustomerLoginEvent>(customerLoginEvent);
    on<CustomerRegisterEvent>(customerRegisterEvent);
    on<CustomerLogoutEvent>(customerLogoutEvent);
    on<CustomerAuthVerificationEvent>(customerAuthVerificationEvent);
  }

  Future<void> _handleEvent(
      CustomerAuthEvent event, Emitter<CustomerAuthState> emit) async {
    emit(CustomerAuthLoadingState());
    try {
      switch (event) {
        case CustomerAuthInitialEvent _:
          // await customerProfileRepository.isCustomerLoggedIn();
          emit(CustomerAuthInitial());
          break;
        case CustomerAuthVerificationEvent _:
          await customerProfileRepository.isCustomerLoggedIn();
          // emit(CustomerAuthVerifiedState());
          break;
        case CustomerLoginEvent loginEvent:
          await customerProfileRepository.loginCustomer(
              loginEvent.email, loginEvent.password);
          emit(CustomerAuthLoggedInState());
          break;
        case CustomerRegisterEvent registerEvent:
          await customerProfileRepository.registerCustomer(
              registerEvent.name, registerEvent.email, registerEvent.password);
          emit(CustomerAuthRegisteredState());
          break;
        case CustomerLogoutEvent _:
          await customerProfileRepository.logoutCustomer();
          emit(CustomerAuthLoggedOutState());
          break;
      }
    } on CustomerException catch (e) {
      emit(CustomerAuthErrorState(e.message));
    } catch (error) {
      emit(CustomerAuthErrorState("Unknown error occurred !!! "));
    }
  }

  void customerAuthInitialEvent(
          CustomerAuthInitialEvent event, Emitter<CustomerAuthState> emit) =>
      _handleEvent(event, emit);

  void customerLoginEvent(
          CustomerLoginEvent event, Emitter<CustomerAuthState> emit) =>
      _handleEvent(event, emit);

  void customerRegisterEvent(
          CustomerRegisterEvent event, Emitter<CustomerAuthState> emit) =>
      _handleEvent(event, emit);

  void customerLogoutEvent(
          CustomerLogoutEvent event, Emitter<CustomerAuthState> emit) =>
      _handleEvent(event, emit);

  void customerAuthVerificationEvent(CustomerAuthVerificationEvent event,
          Emitter<CustomerAuthState> emit) =>
      _handleEvent(event, emit);
}
