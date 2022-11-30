import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app/core/usecase/usecase.dart';
import 'package:shop_app/features/shop/domain/usecases/getAllProducts_usecase.dart';

import '../../domain/entities/products_entity.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetAllProductsUsecase getAllProductsUsecase;
  ProductsBloc(this.getAllProductsUsecase) : super(AllProductsLoadingState()) {
    on<GetAllProducts>((event, emit) async {
      final failurOrSuccess = await getAllProductsUsecase(NoParams());

      failurOrSuccess.fold(
          (failure) => emit(AllProductsErrorState(failure.message)),
          (success) => emit(AllProductsLoadedState(success)));
    });
  }
}
