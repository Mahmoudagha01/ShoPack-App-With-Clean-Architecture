import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shopack_user/features/login/presentation/widgets/alert_snackbar.dart';

import '../../../shop/domain/entities/products_entity.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  List<ProductEntity> favouriteList = [];

  FavouriteBloc() : super(FavouriteInitial()) {
    on<AddToFavorite>((event, emit) {
      if (event.isFavourite) {
        event.product.isFavourite = true;
        favouriteList.add(event.product);

        showSnackbar('Added to Favorite', BuildContext, Colors.green);
        print('added');
        emit(ChangeFavouriteState());
      } else {
        event.product.isFavourite = false;
        favouriteList.remove(event.product);

        showSnackbar('Remove from Favorite', BuildContext, Colors.green);

        emit(ChangeFavouriteState());
      }
    });
  }
}
