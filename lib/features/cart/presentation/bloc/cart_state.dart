part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<ProductEntity> items;
  final ProductEntity? product;
  final bool isAdded;
  final bool isRemoved;
  final double totalPrice;
   int quantity;
   CartLoaded([
    this.items = const [],
    this.isAdded = false,
    this.isRemoved = false,
    this.product,
    this.totalPrice = 0,
    this.quantity=1,
  ]);
}

class ChangePriceState extends CartState {}
