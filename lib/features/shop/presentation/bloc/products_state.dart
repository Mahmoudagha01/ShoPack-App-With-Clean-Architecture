part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class AllProductsLoadingState extends ProductsState {}

class AllProductsLoadedState extends ProductsState {
  final ProductsEntity data;

  const AllProductsLoadedState(
    this.data,
  );
}

class AllProductsErrorState extends ProductsState {
  final String message;

  const AllProductsErrorState(this.message);
}

class ProductsLoadingState extends ProductsState {}

class ProductsLoadedState extends ProductsState {
  final ProductsEntity data;

  const ProductsLoadedState(
    this.data,
  );
}

class FilterProductsLoadingState extends ProductsState {}

class FilterProductsLoadedState extends ProductsState {
  final ProductsEntity data;

  const FilterProductsLoadedState(
    this.data,
  );
}

class ProductsErrorState extends ProductsState {
  final String message;

  const ProductsErrorState(this.message);
}


class SpecificProductsLoadingState extends ProductsState {}

class SpecificProductsLoadedState extends ProductsState {
  final ProductsEntity data;

  const SpecificProductsLoadedState(this.data);
}

class SpecificProductsErrorState extends ProductsState {
final String message;

  const SpecificProductsErrorState(this.message);
}

class ChangeCategoryState extends ProductsState {}

class OpenSearchInitialState extends ProductsState {}

class OpenSearchState extends ProductsState {}
