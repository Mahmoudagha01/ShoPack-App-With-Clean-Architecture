import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shopack_user/core/network/network_info.dart';
import 'package:shopack_user/features/cart/data/datasource/placesAPI.dart';
import 'package:shopack_user/features/cart/data/models/placedetail_model.dart';
import '../../../data/models/suggession_model.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  final NetworkInfo networkInfo;
  LatLng? location;
  final PlacesDataSource placesDataSource;
  AddressCubit(this.networkInfo, this.placesDataSource)
      : super(AddressInitial());

  Future<List<Suggestion>> searchLocation(
      String query, BuildContext context) async {
    emit(SearchListLoadingState());
    final data = await placesDataSource.fetchSuggestions(query, context);
    emit(SearchListLoadedState(places: data));

    return data;
  }

  Future<PlaceDetail> getLocation(
    String placeId,
    BuildContext context,
  ) async {
    emit(GetLocationLoadingState());
    final data = await placesDataSource.getPlaceDetailFromId(placeId, context);
   location = LatLng(
        data.result.geometry.location.lat, data.result.geometry.location.lng);
    emit(GetLocationLoadedState(location: data));

    return data;
  }
}
