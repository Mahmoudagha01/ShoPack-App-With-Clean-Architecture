part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

class GetAllProducts extends ProductsEvent {}

class GetSpecificProduct extends ProductsEvent {
  final String category;
final String minPrice;
  final String maxPrice;
  final String rate;
  const GetSpecificProduct(
    this.category, this.minPrice, this.maxPrice, this.rate,
  );
}

class ChangeCatyegory extends ProductsEvent {
  final int index;

  const ChangeCatyegory(this.index);
}



