import 'package:shopack_user/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:shopack_user/core/usecase/usecase.dart';
import 'package:shopack_user/features/payment/domain/entities/new_order_entity.dart';
import 'package:shopack_user/features/payment/domain/repositories/payment_repository.dart';

class CreateNewOrderUsecase
    implements BaseUsecase<NewOrderEntity, CreateNewOrderUsecaseParams> {
  final PaymentRepository paymentRepository;

  CreateNewOrderUsecase(this.paymentRepository);
  @override
  Future<Either<Failure, NewOrderEntity>> call(
      CreateNewOrderUsecaseParams params) async {
    return await paymentRepository.createNewOrder(CreateNewOrderParams(
        params.itemsPrice,
        params.shippingPrice,
        params.totlaPrice,
        params.name,
        params.price,
        params.quantity,
        params.image,
        params.phone,
        params.pinCode,
        params.address,
        params.city,
        params.country,
        params.status,
        params.id,
        params.state));
  }
}

class CreateNewOrderUsecaseParams {
  final int itemsPrice;
  final int shippingPrice;
  final int totlaPrice;
  final String name;
  final int price;
  final int quantity;
  final String image;
  final String phone;
  final String pinCode;
  final String address;
  final String city;
  final String country;
  final String status;
  final String id;
  final String state;

  CreateNewOrderUsecaseParams(
      this.itemsPrice,
      this.shippingPrice,
      this.totlaPrice,
      this.name,
      this.price,
      this.quantity,
      this.image,
      this.phone,
      this.pinCode,
      this.address,
      this.city,
      this.country,
      this.status,
      this.id,
      this.state);
}
