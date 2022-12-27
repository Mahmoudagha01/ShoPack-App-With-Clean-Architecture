part of 'address_cubit.dart';

abstract class AddressState extends Equatable {
  const AddressState();

  @override
  List<Object> get props => [];
}

class AddressInitial extends AddressState {}
class SearchListLoadingState extends AddressState {}

class SearchListLoadedState extends AddressState {
  final List<Suggestion> places;
  const SearchListLoadedState({
    required this.places,
  });
}

class SearchListErrorState extends AddressState {
  final String message;
  const SearchListErrorState({
    required this.message,
  });
}

class GetLocationLoadingState extends AddressState {}

class GetLocationLoadedState extends AddressState {
  final PlaceDetail location;
  const GetLocationLoadedState({
    required this.location,
  });
}

class GetLocationErrorState extends AddressState {
  final String message;
  const GetLocationErrorState({
    required this.message,
  });
}





