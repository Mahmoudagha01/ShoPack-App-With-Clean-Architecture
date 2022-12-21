import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../shop/domain/entities/products_entity.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  List<ProductEntity> favouriteList = [];

  FavouriteBloc() : super(FavouriteInitial()) {
    on<AddToFavorite>((event, emit) {
      emit(FavouriteInitial());
      if (!event.isFavourite) {
        event.product.isFavourite = true;
        favouriteList.add(event.product);
        emit(AddToFavouriteState());
      } else {
        if (event.isFavourite) {
          event.product.isFavourite = false;
          favouriteList.remove(event.product);
          emit(RemoveFromFavouriteState());
        }
      }
    });
  }
}
