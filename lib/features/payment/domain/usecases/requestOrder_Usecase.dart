import 'package:shopack_user/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:shopack_user/core/usecase/usecase.dart';
import 'package:shopack_user/features/payment/domain/entities/order_request_entity.dart';
import 'package:shopack_user/features/payment/domain/repositories/payment_repository.dart';

class RequestOrderUsecase
    implements BaseUsecase<OrderRequest, OrderRequestUseCaseParams> {
  final PaymentRepository paymentRepository;

  RequestOrderUsecase(this.paymentRepository);
  @override
  Future<Either<Failure, OrderRequest>> call(
      OrderRequestUseCaseParams params) async {
    return await paymentRepository
        .orderRequest(OrderRequestParams(params.token, params.totlaPrice));
  }
}

class OrderRequestUseCaseParams {
  final String token;
  final String totlaPrice;

  OrderRequestUseCaseParams(this.token, this.totlaPrice);
}
