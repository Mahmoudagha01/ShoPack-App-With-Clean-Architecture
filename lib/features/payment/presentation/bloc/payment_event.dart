part of 'payment_bloc.dart';

abstract class PaymentEvent extends Equatable {
  const PaymentEvent();

  @override
  List<Object> get props => [];
}

class RequestAuth extends PaymentEvent {
  final String apiKey;

  const RequestAuth(this.apiKey);
}

class RequestOrder extends PaymentEvent {
  final String token;
  final String totlaPrice;

  const RequestOrder(this.token, this.totlaPrice);
}

class RequestPayment extends PaymentEvent {
    final String token;
  final String totlaPrice;
  final String orderId;
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final String street;
  final String city;
  final String country;
  final String state;
  final String integrationId;

  const RequestPayment(this.token, this.totlaPrice, this.orderId, this.firstName, this.lastName, this.phone, this.email, this.street, this.city, this.country, this.state, this.integrationId);
}
