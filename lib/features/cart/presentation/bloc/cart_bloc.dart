import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shopack_user/features/shop/domain/entities/products_entity.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartStarted>((event, emit) {
      if (state is CartInitial) {
        emit(CartLoading());
        emit( CartLoaded());
         
      }
    });

    on<ItemAdded>((event, emit) {
      final state = this.state;
      if (state is CartLoaded) {
        emit(CartLoading());
        List<ProductEntity> newItems = [...state.items];
        if (state.items.any((element) => element == event.item)) {
          

          emit(CartLoaded(newItems, true, false, event.item,
              state.totalPrice + (event.item.price ) ));
        } else {
          newItems.add(event.item);
          emit(CartLoaded(newItems, true, false, event.item,
              state.totalPrice + (event.item.price ) ));
        }
      }
    });

    on<ItemRemoved>((event, emit) {
      final state = this.state;
      if (state is CartLoaded) {
        emit(CartLoading());
        var newItems = [...state.items];
        var itemRequestForRemoveIndex =
            newItems.indexWhere((element) => element == event.item);
        
        if (itemRequestForRemoveIndex != -1 &&
            newItems[itemRequestForRemoveIndex].quantity > 1) {
          emit(CartLoaded(newItems, false, true, event.item,
              state.totalPrice - (event.item.price ) ));
        } else {
          newItems.remove(event.item);
          emit(CartLoaded(newItems, false, true, event.item,
              state.totalPrice - (event.item.price ) ));
        }
      }
    });

    // on<ChangeQuantity>((event, emit) {
    //   if (event.isAdd) {
    //   event.item.quantity++;
  
    //   emit(ChangePriceState());
    // } else {
    //   if (event.item.quantity > 1) {
    //     event.item.quantity--;
    //     emit(ChangePriceState());
    //   } else {
    //     event.item.quantity;
    //     emit(ChangePriceState());
    //   }
    // }
    // });
  }
}
