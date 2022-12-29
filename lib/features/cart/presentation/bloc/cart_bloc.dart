
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shopack_user/features/shop/domain/entities/products_entity.dart';
import '../../data/models/cart_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  List<CartProduct> cartItems = [];
  num totalAmount = 0;

  final Box<CartProduct> itemBox = Hive.box<CartProduct>("product-cahce");
  CartBloc() : super(CartInitial()) {
    on<AddToCart>((event, emit) {
      emit(CartLoading());

      CartProduct cartProduct = CartProduct(
          id: event.product.id,
          name: event.product.name,
          description: event.product.description,
          price: event.product.price,
          ratings: event.product.ratings,
          category: event.product.category,
          stock: event.product.stock,
          numOfReviews: event.product.numOfReviews,
          user: event.product.user,
          productImage: event.product.images.first.url,
          amount: event.product.qouantity);
      itemBox.add(cartProduct);

      List<CartProduct> list = itemBox.values.toList();
      cartItems = list;

      totalAmount = 0;
      for (var element in list) {
        totalAmount = totalAmount + element.amount * element.price;
      }

      emit(AddToCartState());
      emit(CartLoaded(list));
    });

    on<RemoveFromCart>((event, emit) async {
      emit(CartLoading());
      await itemBox.deleteAt(event.id);
      List<CartProduct> list = itemBox.values.toList();
      cartItems = list;
      totalAmount = 0;
      for (var element in list) {
        totalAmount = totalAmount + element.amount * element.price;
      }

      emit(CartLoaded(list));
    });

    on<IncrementCount>((event, emit) async {
      event.cartProduct.amount++;
      totalAmount = 0;
      totalAmount =
          totalAmount + event.cartProduct.amount * event.cartProduct.price;
      List<CartProduct> list = itemBox.values.toList();
      cartItems = list;
      emit(IncrementCountState());
      emit(CartLoaded(list));
    });

    on<DecrementCount>((event, emit) async {
      if (event.cartProduct.amount > 0) {
        event.cartProduct.amount--;
        totalAmount = 0;
        totalAmount =
            totalAmount + event.cartProduct.amount * event.cartProduct.price;
        List<CartProduct> list = itemBox.values.toList();
        cartItems = list;
        emit(IncrementCountState());
        emit(CartLoaded(list));
      }
    });
  }
}
