// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'location_bloc.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object> get props => [];
}

class CheckPermission extends LocationEvent {
  final BuildContext context;

  const CheckPermission(this.context);
}

class GetCurrentLocation extends LocationEvent {}

class SelectPosition extends LocationEvent {
  final LatLng latLng;
  const SelectPosition({
    required this.latLng,
  });
}

class SearchLocation extends LocationEvent {
  final String query;

  const SearchLocation({
    required this.query,
  });
}

class SelectMethod extends LocationEvent {

  final int index;
  const SelectMethod( this.index);
}
