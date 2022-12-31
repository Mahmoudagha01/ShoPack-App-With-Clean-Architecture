import 'package:shopack_user/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:shopack_user/core/usecase/usecase.dart';
import 'package:shopack_user/features/payment/domain/entities/payment_request_entity.dart';
import 'package:shopack_user/features/payment/domain/repositories/payment_repository.dart';

class RequestPaymentUsecase
    implements BaseUsecase<PaymentRequestEntity, PaymentRequestUsecaseParams> {
  final PaymentRepository paymentRepository;

  RequestPaymentUsecase(this.paymentRepository);
  @override
  Future<Either<Failure, PaymentRequestEntity>> call(
      PaymentRequestUsecaseParams params) async {
    return await paymentRepository.paymentRequest(
      PaymentRequestParams(
          params.token,
          params.totlaPrice,
          params.orderId,
          params.firstName,
          params.lastName,
          params.phone,
          params.email,
          params.street,
          params.city,
          params.country,
          params.state,
          params.integrationId),
    );
  }
}

class PaymentRequestUsecaseParams {
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
  PaymentRequestUsecaseParams(
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
