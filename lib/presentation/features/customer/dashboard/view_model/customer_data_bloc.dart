import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mca_project/data/repositories/customer/customer_data_repository.dart';

part 'customer_data_event.dart';
part 'customer_data_state.dart';

class CustomerDataBloc extends Bloc<CustomerDataEvent, CustomerDataState> {
  final CustomerDataRepository customerDataRepository;
  CustomerDataBloc({required this.customerDataRepository})
      : super(CustomerDataInitialState()) {
    on<LoadCustomerDataEvent>(_loadCustomerData);
  }

  Future<void> _loadCustomerData(
      LoadCustomerDataEvent event, Emitter emit) async {
    emit(CustomerDataLoadingState());
    try {
      await customerDataRepository.setData();
      emit(CustomerDataLoadedState());
    } catch (e) {
      emit(CustomerDataErrorState(error: e.toString()));
    }
  }
}
