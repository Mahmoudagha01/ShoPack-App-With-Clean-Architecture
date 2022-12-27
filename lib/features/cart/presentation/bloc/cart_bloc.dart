// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:shopack_user/features/shop/domain/entities/products_entity.dart';

import '../../data/models/cart_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {

  List<ProductEntity> products = [];
  List<ProductEntity> basketItems = [];
  int totalPrice = 0;
    Map<String, CartItem> items = {};
  CartBloc(
   
   

  ) : super(CartInitial()) {
    on<AddToCart>((event, emit) async {
       emit(CartLoading());
         if (items.containsKey(event.pdtid)) {
      items.update(
          event.pdtid,
          (existingCartItem) => CartItem(
              id: DateTime.now().toString(),
              name: existingCartItem.name,
              quantity: existingCartItem.quantity + 1,
              price: existingCartItem.price));
    } else {
      items.putIfAbsent(
          event.pdtid,
          () => CartItem(
                name: event.name,
                id: DateTime.now().toString(),
                quantity: 1,
                price: event.price,
              ));
    }
        emit(AddToCartState());

      
    });



    on<RemoveFromCart>((event, emit) async {
         emit(CartLoading());
        items.remove(event.id);
        emit(RemoveFromCartState());
     
      
    });
      on<RemoveSingleItemFromCart>((event, emit) async {
         emit(CartLoading());
     if (!items.containsKey(event.id)) {
      return;
    }
    if (items[event.id]!.quantity > 1) {
      items.update(
          event.id,
          (existingCartItem) => CartItem(
              id: DateTime.now().toString(),
              name: existingCartItem.name,
              quantity: existingCartItem.quantity - 1,
              price: existingCartItem.price));
    }
        emit(RemoveFromCartState());
     
      
    });
    
    on<GetTotalMoney>((event, emit) async {
      items.forEach((key, cartItem) {
      totalPrice+= cartItem.price * cartItem.quantity;
    });

      emit(ChangePriceState());
    });
    // on<IncrementCount>((event, emit) async {
    //   event.product.quantity++;
    //     emit(CartChangeCountState(event.product.quantity));
    //   GetTotalMoney(event.product);
    //   if (!basketItems.contains(event.product)) {
    //     basketItems.add(event.product);
    //   }

    // });
    // on<DecrementCount>((event, emit) async {
    //   if (event.product.quantity != 0) {
    //     event.product.quantity--;
    //               emit(CartChangeCountState(event.product.quantity));
    //     GetTotalMoney(event.product);
    //     if (event.product.quantity > 1) {
    //       basketItems.remove(event.product);
    //     }
    
    //   }
    // });

    // // on<CartStarted>((event, emit) {
    // //   if (state is CartInitial) {
    // //     emit(CartLoading());
    // //     emit(CartLoaded());
    // //   }
    // // });

    // // on<ItemAdded>((event, emit) {
    // //   final state = this.state;
    // //   if (state is CartLoaded) {
    // //     emit(CartLoading());
    // //      newItems = [...state.items];
    // //     if (state.items.any((element) => element == event.item)) {
    // //       emit(CartLoaded(newItems, true, false, event.item,
    // //           state.totalPrice + (event.item.price)));
    // //     } else {
    // //       newItems.add(event.item);
    // //       emit(CartLoaded(newItems, true, false, event.item,
    // //           state.totalPrice + (event.item.price)));
    // //     }
    // //   }
    // // });

    // // on<ItemRemoved>((event, emit) {
    // //   final state = this.state;
    // //   if (state is CartLoaded) {
    // //     emit(CartLoading());
    // //    newItems = [...state.items];
    // //     var itemRequestForRemoveIndex =
    // //         newItems.indexWhere((element) => element == event.item);

    // //     if (itemRequestForRemoveIndex != -1 &&
    // //         newItems[itemRequestForRemoveIndex].quantity > 1) {
    // //       emit(CartLoaded(newItems, false, true, event.item,
    // //           state.totalPrice - (event.item.price)));
    // //     } else {
    // //       newItems.remove(event.item);
    // //       emit(CartLoaded(newItems, false, true, event.item,
    // //           state.totalPrice - (event.item.price)));
    // //     }
    // //   }
    // // });
  }
}
