import 'package:flutter_bloc/flutter_bloc.dart';
import '/data/repositories/customer/customer_data_repository.dart';

part 'customer_data_event.dart';
part 'customer_data_state.dart';

class CustomerDataBloc extends Bloc<CustomerDataEvent, CustomerDataState> {
  final CustomerDataRepository customerDataRepository;
  CustomerDataBloc({required this.customerDataRepository})
      : super(CustomerDataInitialState()) {
    on<LoadCustomerDataEvent>(_loadCustomerData);

    on<ChangeCustomerCurrentLocationEvent>(_changeCustomerCurrentLocation);
  }

  Future<void> _loadCustomerData(
      LoadCustomerDataEvent event, Emitter emit) async {
    emit(CustomerDataLoadingState());
    try {
      await customerDataRepository.fetchData();
      emit(CustomerDataLoadedState());
    } catch (e) {
      emit(CustomerDataErrorState(error: e.toString()));
    }
  }

  Future<void> _changeCustomerCurrentLocation(
      ChangeCustomerCurrentLocationEvent event, Emitter emit) async {
    emit(CustomerDataLoadedState(isChangingLocation: true));
    try {
      await customerDataRepository.changeCurrentLocation(event.currentLocation);
      emit(CustomerDataLoadedState());
    } catch (e) {
      emit(CustomerDataErrorState(error: e.toString()));
    }
  }
}
