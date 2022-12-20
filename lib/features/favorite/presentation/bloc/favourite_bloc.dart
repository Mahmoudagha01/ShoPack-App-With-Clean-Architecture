import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../shop/domain/entities/products_entity.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  FavouriteBloc() : super(FavouriteInitial()) {
    on<AddToFavorite>((event, emit) {
      
    });
  }
}
