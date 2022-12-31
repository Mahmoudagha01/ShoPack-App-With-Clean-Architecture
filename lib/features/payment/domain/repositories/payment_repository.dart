import 'package:dartz/dartz.dart';
import 'package:shopack_user/core/error/failure.dart';
import 'package:shopack_user/features/payment/domain/entities/auth_request_entity.dart';
import 'package:shopack_user/features/payment/domain/entities/order_request_entity.dart';
import 'package:shopack_user/features/payment/domain/entities/payment_request_entity.dart';

abstract class PaymentRepository {
  Future<Either<Failure, AuthRequestEntity>> requestAuth(
      RequestAuthParams params);
  Future<Either<Failure, OrderRequest>> orderRequest(OrderRequestParams params);
  Future<Either<Failure, PaymentRequestEntity>> paymentRequest(
      PaymentRequestParams params);
}

class RequestAuthParams {
  final String apiKey;

  RequestAuthParams(this.apiKey);
}

class OrderRequestParams {
  final String token;
  final String totlaPrice;

  OrderRequestParams(this.token, this.totlaPrice);
}

class PaymentRequestParams {
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
  final String integrationId;
  final String state;
  PaymentRequestParams(
      this.token,
      this.totlaPrice,
      this.orderId,
      this.firstName,
      this.lastName,
      this.phone,
      this.email,
      this.street,
      this.city,
      this.country,
      this.state,
      this.integrationId);
}
