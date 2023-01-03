import 'package:dartz/dartz.dart';
import 'package:shopack_user/core/error/failure.dart';
import 'package:shopack_user/core/usecase/usecase.dart';
import 'package:shopack_user/features/payment/domain/entities/all_orders_entity.dart';
import 'package:shopack_user/features/payment/domain/entities/auth_request_entity.dart';
import 'package:shopack_user/features/payment/domain/entities/new_order_entity.dart';
import 'package:shopack_user/features/payment/domain/entities/order_request_entity.dart';
import 'package:shopack_user/features/payment/domain/entities/payment_request_entity.dart';

abstract class PaymentRepository {
  Future<Either<Failure, AuthRequestEntity>> requestAuth(
      RequestAuthParams params);
  Future<Either<Failure, OrderRequest>> orderRequest(OrderRequestParams params);
  Future<Either<Failure, PaymentRequestEntity>> paymentRequest(
      PaymentRequestParams params);
  Future<Either<Failure, NewOrderEntity>> createNewOrder(
      CreateNewOrderParams params);
      Future<Either<Failure, AllOrdersEntity>> getAllOrders(
      NoParams params);
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

class CreateNewOrderParams {
  final int itemsPrice;
  final int shippingPrice;
  final int totlaPrice;
  final List<Map<String, dynamic>> orderItems;
  final String phone;
  final String pinCode;
  final String address;
  final String city;
  final String country;
  final String status;
  final String id;
  final String state;

  CreateNewOrderParams(
      this.itemsPrice,
      this.shippingPrice,
      this.totlaPrice,
      this.phone,
      this.pinCode,
      this.address,
      this.city,
      this.country,
      this.status,
      this.id,
      this.state, this.orderItems);
}
