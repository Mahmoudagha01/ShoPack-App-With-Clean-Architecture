// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shopack_user/core/error/error_handler.dart';
import 'package:shopack_user/core/network/network_info.dart';
import 'package:shopack_user/core/utilities/strings.dart';
import 'package:shopack_user/features/cart/data/datasource/placesAPI.dart';

import '../widgets/permissiondialog.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final PlacesDataSource placesDataSource;
  Position? myCurrentPosition;
  CameraPosition? initialTarget;
  List<Placemark>? currentAddress;
  late GoogleMapController googleMapController;
  TextEditingController searchController = TextEditingController();
  final NetworkInfo networkInfo;
  LocationBloc(
    this.placesDataSource,
    this.networkInfo,
  ) : super(LocationInitial()) {
    on<CheckPermission>((event, emit) async {
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      } else if (permission == LocationPermission.deniedForever) {
        showDialog(
            context: event.context,
            barrierDismissible: false,
            builder: (context) => const PermissionDialog());
      }
    });

    on<GetCurrentLocation>((event, emit) async {
      if (await networkInfo.isConnected) {
        try {
          emit(MapLoadingState());

          myCurrentPosition = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high);

          initialTarget = CameraPosition(
              target: LatLng(
                  myCurrentPosition!.latitude, myCurrentPosition!.longitude),
              zoom: 16);
          emit(MapLoadedState());
          currentAddress = await GeocodingPlatform.instance.placemarkFromCoordinates(
              myCurrentPosition!.latitude, myCurrentPosition!.longitude);
          emit(MapSelectedPosition(currentAddress!));
        } catch (error) {
          print(error);
          emit(MapErrorState(ErrorHandler.handle(error).failure.message));
        }
      } else {
        ErrorHandler.handle(AppStrings.noInternetError);
      }
    });

    on<SelectPosition>((event, emit) async {
      if (await networkInfo.isConnected) {
        try {
          emit(MapLoadingState());
          searchController.text = '';
          myCurrentPosition = Position(
              longitude: event.latLng.longitude,
              latitude: event.latLng.latitude,
              timestamp: null,
              accuracy: 0.0,
              altitude: 0.0,
              heading: 0.0,
              speed: 0.0,
              speedAccuracy: 0.0);
          googleMapController.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: LatLng(
                    myCurrentPosition!.latitude, myCurrentPosition!.longitude),
                zoom: 15,
              ),
            ),
          );
          emit(MapLoadedState());
          currentAddress = await GeocodingPlatform.instance.placemarkFromCoordinates(
              myCurrentPosition!.latitude, myCurrentPosition!.longitude);
          emit(MapSelectedPosition(currentAddress!));
        } catch (error) {
          print(error);
          emit(MapErrorState(ErrorHandler.handle(error).failure.message));
        }
      } else {
        ErrorHandler.handle(AppStrings.noInternetError);
      }
    });
  }
}
