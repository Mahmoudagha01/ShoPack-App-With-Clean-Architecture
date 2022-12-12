import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/core/usecase/usecase.dart';
import 'package:shop_app/features/shop/domain/usecases/getAllProducts_usecase.dart';
import 'package:shop_app/features/shop/domain/usecases/getSpecificProduct.dart';
import '../../domain/entities/products_entity.dart';
part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  List<String> categories = [
    "Clothes",
    "Shoes",
    "Electronics",
    "Smartphones",
    "Camera",
    "Sports",
    "Books",
  ];
  int current = 0;
  RangeValues priceSelectRange = const RangeValues(200, 400);
  double rateValue=0;
  final GetAllProductsUsecase getAllProductsUsecase;
  final GetSpecificProductUseCase getSpecificProductUseCase;
  ProductsBloc(this.getAllProductsUsecase, this.getSpecificProductUseCase)
      : super(AllProductsLoadingState()) {
    on<GetAllProducts>((event, emit) async {
      final failurOrSuccess = await getAllProductsUsecase(NoParams());

      failurOrSuccess.fold(
          (failure) => emit(AllProductsErrorState(failure.message)),
          (success) => emit(AllProductsLoadedState(success)));
    });

    on<GetSpecificProduct>((event, emit) async {
      final failurOrSuccess = await getSpecificProductUseCase(
        GetProductUseCaseParams(
            event.category, event.minPrice, event.maxPrice, event.rate),
      );

      failurOrSuccess.fold(
          (failure) => emit(ProductsErrorState(failure.message)),
          (success) => emit(ProductsLoadedState(success)));
    });
    on<ChangeCatyegory>((event, emit) {
      current = event.index;
      emit(ChangeCategoryState());
    });
  
  }
}
