import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopack_user/core/usecase/usecase.dart';
import 'package:shopack_user/features/payment/domain/entities/new_order_entity.dart';
import 'package:shopack_user/features/payment/domain/usecases/createNewOrder_Usecase.dart';
import 'package:shopack_user/features/payment/domain/usecases/getAllOrders.dart';

import '../../domain/entities/all_orders_entity.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  List<AllOrderEntity> activeOrders = [];
  List<AllOrderEntity> pastOrders = [];
  final CreateNewOrderUsecase createNewOrderUsecase;
  final GetAllOrderesUsecase getAllOrderesUsecase;
  OrderBloc(this.createNewOrderUsecase, this.getAllOrderesUsecase)
      : super(OrderInitial()) {
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
    on<GetAllOrders>((event, emit) async {
      emit(AllOrdersLoading());
      final failureOrSuccess = await getAllOrderesUsecase(NoParams());
      failureOrSuccess.fold((failure) => emit(AllOrdersError(failure.message)),
          (success) {
        pastOrders = success.orders.where(
          (element) => element.orderStatus == "Delivered",
        ).toList() ;
        print(pastOrders);
        activeOrders =success.orders.where((element) => element.orderStatus=='Processing',).toList();
        emit(AllOrdersLoaded(success));
      });
    });
  }
}
