part of 'order_bloc.dart';

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

class OrderInitial extends OrderState {}

class CreateOrderLoading extends OrderState {}

class CreateOrderLoaded extends OrderState {
  final NewOrderEntity data;

  const CreateOrderLoaded(this.data);
}

class CreateOrderError extends OrderState {
  final String message;

  const CreateOrderError(this.message);
}

class AllOrdersLoading extends OrderState {}

class AllOrdersLoaded extends OrderState {
  final AllOrdersEntity data;

  const AllOrdersLoaded(this.data);
}

class AllOrdersError extends OrderState {
  final String message;

  const AllOrdersError(this.message);
}
