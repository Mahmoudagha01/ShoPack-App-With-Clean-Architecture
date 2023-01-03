import 'package:shopack_user/core/error/error_handler.dart';
import 'package:shopack_user/core/network/network_info.dart';
import 'package:shopack_user/core/usecase/usecase.dart';
import 'package:shopack_user/core/utilities/strings.dart';
import 'package:shopack_user/features/payment/data/datasources/payment_datasource.dart';
import 'package:shopack_user/features/payment/domain/entities/all_orders_entity.dart';
import 'package:shopack_user/features/payment/domain/entities/new_order_entity.dart';
import 'package:shopack_user/features/payment/domain/entities/payment_request_entity.dart';
import 'package:shopack_user/features/payment/domain/entities/order_request_entity.dart';
import 'package:shopack_user/features/payment/domain/entities/auth_request_entity.dart';
import 'package:shopack_user/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:shopack_user/features/payment/domain/repositories/payment_repository.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  final NetworkInfo networkInfo;
  final PaymentDataSource paymentDataSource;

  PaymentRepositoryImpl(this.networkInfo, this.paymentDataSource);
  @override
  Future<Either<Failure, OrderRequest>> orderRequest(
      OrderRequestParams params) async {
    if (await networkInfo.isConnected) {
      try {
        final data = await paymentDataSource
            .requestOrder(OrderRequestParams(params.token, params.totlaPrice));
        return right(data);
      } catch (error) {
        return left(ErrorHandler.handle(error).failure);
      }
    } else {
      return left(const OfflineFailure(AppStrings.noInternetError));
    }
  }

  @override
  Future<Either<Failure, PaymentRequestEntity>> paymentRequest(
      PaymentRequestParams params) async {
    if (await networkInfo.isConnected) {
      try {
        final data = await paymentDataSource.requestPayment(
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
                params.integrationId));
        return right(data);
      } catch (error) {
        return left(ErrorHandler.handle(error).failure);
      }
    } else {
      return left(const OfflineFailure(AppStrings.noInternetError));
    }
  }

  @override
  Future<Either<Failure, AuthRequestEntity>> requestAuth(
      RequestAuthParams params) async {
    if (await networkInfo.isConnected) {
      try {
        final data = await paymentDataSource.requestAuth(RequestAuthParams(
          params.apiKey,
        ));
        return right(data);
      } catch (error) {
        return left(ErrorHandler.handle(error).failure);
      }
    } else {
      return left(const OfflineFailure(AppStrings.noInternetError));
    }
  }

  @override
  Future<Either<Failure, NewOrderEntity>> createNewOrder(
      CreateNewOrderParams params) async {
    if (await networkInfo.isConnected) {
      try {
        final data = await paymentDataSource.createNewOrder(
            CreateNewOrderParams(
                params.itemsPrice,
                params.shippingPrice,
                params.totlaPrice,
                params.phone,
                params.pinCode,
                params.address,
                params.city,
                params.country,
                params.status,
                params.id,
                params.state,
                params.orderItems));
        return right(data);
      } catch (error) {
        return left(ErrorHandler.handle(error).failure);
      }
    } else {
      return left(const OfflineFailure(AppStrings.noInternetError));
    }
  }

  @override
  Future<Either<Failure, AllOrdersEntity>> getAllOrders(NoParams params) async {
    if (await networkInfo.isConnected) {
      try {
        final data = await paymentDataSource.getAllOrders(params);
        return right(data);
      } catch (error) {
        return left(ErrorHandler.handle(error).failure);
      }
    } else {
      return left(const OfflineFailure(AppStrings.noInternetError));
    }
  }
}
