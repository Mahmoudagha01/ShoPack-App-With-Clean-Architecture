// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shopack_user/core/utilities/strings.dart';
import 'package:shopack_user/features/cart/data/datasource/placesAPI.dart';
import 'package:shopack_user/features/cart/presentation/bloc/cubit/address_cubit.dart';
import 'package:shopack_user/features/cart/presentation/bloc/location_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/colors/colors.dart';
import '../../../../core/utilities/mediaquery.dart';
import '../../../login/presentation/widgets/alert_snackbar.dart';
import '../../data/models/suggession_model.dart';

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          AppStrings.selectnewaddress,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: BlocConsumer<LocationBloc, LocationState>(
        listener: (context, state) {
          final bloc = BlocProvider.of<LocationBloc>(context);
          if (state is MapSelectedPosition) {
            showSnackbar(
                "The selected area is : ${bloc.currentAddress![0].street}  ${bloc.currentAddress![0].name!}  ${bloc.currentAddress![0].administrativeArea!} - ${bloc.currentAddress![0].country!}",
                context,
                ColorManager.white);
          }
        },
        builder: (context, state) {
          final bloc = BlocProvider.of<LocationBloc>(context);
          if (state is MapLoadingState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: kHeight(context) / 8,
                ),
                const Center(child: CircularProgressIndicator()),
              ],
            );
          } else if (state is MapLoadedState || state is MapSelectedPosition) {
            return Stack(
              children: [
                SizedBox(
                  width: kWidth(context),
                  height: kHeight(context),
                  child: GoogleMap(
                    initialCameraPosition: bloc.initialTarget!,
                    onMapCreated: (controller) {
                      bloc.googleMapController = controller;
                    },
                    markers: {
                      Marker(
                        markerId: const MarkerId('1'),
                        icon: BitmapDescriptor.defaultMarkerWithHue(
                            BitmapDescriptor.hueRed),
                        position: bloc.myCurrentPosition != null
                            ? LatLng(bloc.myCurrentPosition!.latitude,
                                bloc.myCurrentPosition!.longitude)
                            : const LatLng(0.0, 0.0),
                      ),
                    },
                    onTap: (tapped) async {
                      bloc.add(SelectPosition(latLng: tapped));
                    },
                  ),
                ),
                Positioned(
                  left: 20,
                  right: 20,
                  top: 20,
                  child: TextField(
                    controller: bloc.searchController,
                    readOnly: true,
                    onTap: () {
                      PlacesDatasourceImpl.sessionToken = const Uuid().v4();
                      showDialog(
                        builder: (context) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: kHeight(context) / 10,
                                horizontal: 20),
                            child: Column(children: [
                              Material(
                                color: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: TypeAheadField(
                                  textFieldConfiguration:
                                      TextFieldConfiguration(
                                    controller: controller,
                                    textInputAction: TextInputAction.search,
                                    autofocus: true,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    keyboardType: TextInputType.streetAddress,
                                    decoration: InputDecoration(
                                      hintText: AppStrings.searchlocation,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            style: BorderStyle.none, width: 0),
                                      ),
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .headline2!
                                          .copyWith(
                                            fontSize: 15,
                                            color:
                                                Theme.of(context).disabledColor,
                                          ),
                                    ),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2!
                                        .copyWith(
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .color,
                                          fontSize: 18,
                                        ),
                                  ),
                                  errorBuilder: (context, error) =>
                                      const SizedBox(),
                                  suggestionsCallback: (pattern) async {
                                    return BlocProvider.of<AddressCubit>(
                                            context)
                                        .searchLocation(
                                            controller.text, context);
                                  },
                                  itemBuilder:
                                      (context, Suggestion suggestion) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(children: [
                                        const Icon(Icons.location_on),
                                        Expanded(
                                          child: Text(suggestion.description,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline2!
                                                  .copyWith(
                                                    color: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1!
                                                        .color,
                                                    fontSize: 16,
                                                  )),
                                        ),
                                      ]),
                                    );
                                  },
                                  onSuggestionSelected:
                                      (Suggestion suggestion) async {
                                    await BlocProvider.of<AddressCubit>(context)
                                        .getLocation(
                                            suggestion.placeId, context);

                                    LatLng? latLng =
                                        BlocProvider.of<AddressCubit>(context)
                                            .location;

                                    if (latLng != null) {
                                      bloc.myCurrentPosition = Position(
                                          longitude: latLng.longitude,
                                          latitude: latLng.latitude,
                                          timestamp: null,
                                          accuracy: 0.0,
                                          altitude: 0.0,
                                          heading: 0.0,
                                          speed: 0.0,
                                          speedAccuracy: 0.0);
                                      bloc.googleMapController.animateCamera(
                                        CameraUpdate.newCameraPosition(
                                          CameraPosition(
                                            target: latLng,
                                            zoom: 15,
                                          ),
                                        ),
                                      );
                                    }
                                    bloc.searchController.text =
                                        suggestion.description;
                                    Navigator.pop(context);
                                  },
                                ),
                              )
                            ]),
                          );
                        },
                        context: context,
                      );
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      hintText: AppStrings.searchlocation,
                      hintStyle: const TextStyle(
                        color: Color(0xFF535353),
                      ),
                      suffixIcon: const SizedBox(),
                    ),
                  ),
                ),
              ],
            );
          } else if (state is MapErrorState) {
            return Center(child: Text(state.message));
          } else {
            return const SizedBox(
              child: Text("data"),
            );
          }
        },
      ),
    );
  }
}
