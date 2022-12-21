part of 'favourite_bloc.dart';

abstract class FavouriteState extends Equatable {
  const FavouriteState();
  
  @override
  List<Object> get props => [];
}

class FavouriteInitial extends FavouriteState {}


class AddToFavouriteState extends FavouriteState {}

class RemoveFromFavouriteState extends FavouriteState {}