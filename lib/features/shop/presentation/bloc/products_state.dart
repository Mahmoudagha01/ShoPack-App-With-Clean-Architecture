part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class AllProductsLoadingState extends ProductsState {}

class AllProductsLoadedState extends ProductsState {
  final ProductsEntity data;

  const AllProductsLoadedState(this.data,);
}

class AllProductsErrorState extends ProductsState {
  final String message;

  const AllProductsErrorState(this.message);
}
