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
