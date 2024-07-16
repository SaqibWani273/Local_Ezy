import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/repositories/shop/shop_data_repository.dart';
import '../../../../../utils/exceptions/custom_exception.dart';

part 'shop_event.dart';
part 'shop_state.dart';

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  final ShopDataRepository shopDataRepository;
  ShopBloc({required this.shopDataRepository}) : super(ShopInitialState()) {
    on<LoadAllCategoriesEvent>(_loadAllCategories);
  }
  Future<void> _loadAllCategories(
      LoadAllCategoriesEvent event, Emitter emit) async {
    emit(ShopLoadingState());
    try {
      await shopDataRepository.loadAllCategories();
      emit(ShopLoadedAllCategoriesState());
    } on CustomException catch (e) {
      emit(ShopErrorState(error: e.toString()));
    }
  }
}
