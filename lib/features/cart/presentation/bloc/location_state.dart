// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'location_bloc.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

class LocationInitial extends LocationState {}

class MapLoadingState extends LocationState {}

class MapLoadedState extends LocationState {}

class MapSelectedPosition extends LocationState {
  final List<Placemark> currentAddress;

  const MapSelectedPosition(this.currentAddress);
}

class MapErrorState extends LocationState {
  final String message;

  const MapErrorState(this.message);
}

class SelectMethodState extends LocationState{
  
}
