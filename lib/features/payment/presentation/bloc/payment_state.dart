// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'payment_bloc.dart';

abstract class PaymentState extends Equatable {
  const PaymentState();

  @override
  List<Object> get props => [];
}

class PaymentInitial extends PaymentState {}

class Paymentloading extends PaymentState {}

class PaymentAuthFinished extends PaymentState {
  final AuthRequestEntity data;

  const PaymentAuthFinished(this.data);
}

class PaymentAuthError extends PaymentState {
  final String error;
  const PaymentAuthError({
    required this.error,
  });
}


class PaymentOrderFinished extends PaymentState {
  final OrderRequest data;

  const PaymentOrderFinished(this.data);
}

class PaymentOrderError extends PaymentState {
  final String error;
  const PaymentOrderError({
    required this.error,
  });
}


class PaymentRequestFinished extends PaymentState {
  final PaymentRequestEntity data;

  const PaymentRequestFinished(this.data);
}

class PaymentRequestError extends PaymentState {
  final String error;
  const PaymentRequestError({
    required this.error,
  });
}