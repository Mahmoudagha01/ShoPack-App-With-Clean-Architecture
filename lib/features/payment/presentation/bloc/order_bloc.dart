import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopack_user/features/payment/data/models/neworder_model.dart';
import 'package:shopack_user/features/payment/domain/entities/new_order_entity.dart';
import 'package:shopack_user/features/payment/domain/usecases/createNewOrder_Usecase.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final CreateNewOrderUsecase createNewOrderUsecase;
  OrderBloc(this.createNewOrderUsecase) : super(OrderInitial()) {
    on<CreateNewOrder>((event, emit) async {
      emit(CreateOrderLoading());
      final failureOrSuccess = await createNewOrderUsecase(
          CreateNewOrderUsecaseParams(
              event.itemsPrice,
              event.shippingPrice,
              event.totlaPrice,
             
            
              event.phone,
              event.pinCode,
              event.address,
              event.city,
              event.country,
              event.status,
              event.id,
              event.state,
              event.orderItems));
      failureOrSuccess.fold(
          (failure) => emit(CreateOrderError(failure.message)),
          (success) => emit(CreateOrderLoaded(success)));
    });
  }
}
