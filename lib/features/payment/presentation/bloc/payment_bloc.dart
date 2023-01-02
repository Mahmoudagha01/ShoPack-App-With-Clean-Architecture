// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopack_user/features/payment/domain/entities/auth_request_entity.dart';
import 'package:shopack_user/features/payment/domain/entities/order_request_entity.dart';
import 'package:shopack_user/features/payment/domain/entities/payment_request_entity.dart';
import 'package:shopack_user/features/payment/domain/usecases/requestAuth_Usecase.dart';
import 'package:shopack_user/features/payment/domain/usecases/requestOrder_Usecase.dart';
import '../../domain/usecases/requestPayment_Usecase.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  String PAYMOB_FIRST_TOKEN = '';
  String FINAL_TOKEN_CARD = '';
  String ORDER_ID = '';

  final RequestAuthUsecase requestAuthUsecase;
  final RequestOrderUsecase requestOrderUsecase;
  final RequestPaymentUsecase requestPaymentUsecase;
  PaymentBloc(
    this.requestAuthUsecase,
    this.requestOrderUsecase,
    this.requestPaymentUsecase,
  ) : super(PaymentInitial()) {
    on<RequestAuth>((event, emit) async {
      emit(Paymentloading());
      final failureOrSuccess =
          await requestAuthUsecase(RequestAuthUseCaseParams(event.apiKey));
      failureOrSuccess
          .fold((failure) => emit(PaymentAuthError(error: failure.message)),
              (success) async {
        PAYMOB_FIRST_TOKEN = success.token;

        emit(PaymentAuthFinished(success));
      });
    });
    on<RequestOrder>((event, emit) async {
      emit(Paymentloading());
      final failureOrSuccess = await requestOrderUsecase(
          OrderRequestUseCaseParams(event.token, event.totlaPrice));
      failureOrSuccess
          .fold((failure) => emit(PaymentOrderError(error: failure.message)),
              (success) {
        ORDER_ID = success.id.toString();
        emit(PaymentOrderFinished(success));
      });
    });
    on<RequestPayment>((event, emit) async {
      emit(Paymentloading());
      final failureOrSuccess = await requestPaymentUsecase(
          PaymentRequestUsecaseParams(
              event.token,
              event.totlaPrice,
              event.orderId,
              event.firstName,
              event.lastName,
              event.phone,
              event.email,
              event.street,
              event.city,
              event.country,
              event.state,
              event.integrationId));
      failureOrSuccess
          .fold((failure) => emit(PaymentRequestError(error: failure.message)),
              (success) {
        FINAL_TOKEN_CARD = success.token;

        emit(PaymentRequestFinished(success));
      });
    });
  }
}
