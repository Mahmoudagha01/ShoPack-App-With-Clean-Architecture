import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shopack_user/core/colors/colors.dart';
import 'package:shopack_user/core/utilities/routes.dart';
import 'package:shopack_user/features/cart/presentation/bloc/location_bloc.dart';
import '../../../../core/utilities/mediaquery.dart';

class MapPreview extends StatelessWidget {
  final LocationBloc bloc;
  const MapPreview({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: kHeight(context) / 4,
        width: MediaQuery.of(context).size.width,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              GoogleMap(
                minMaxZoomPreference: const MinMaxZoomPreference(0, 16),
                mapType: MapType.normal,
                initialCameraPosition: bloc.initialTarget!,
                zoomControlsEnabled: false,
                compassEnabled: false,
                indoorViewEnabled: true,
                mapToolbarEnabled: false,
              ),
              Container(
                  width: kWidth(context),
                  alignment: Alignment.center,
                  height: kHeight(context),
                  child: const Icon(
                    Icons.location_on,
                    color: ColorManager.orangeLight,
                    size: 35,
                  )),
              Positioned(
                bottom: 10,
                right: 0,
                child: InkWell(
                  onTap: () {
                    bloc.add(GetCurrentLocation());
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    margin: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: ColorManager.white,
                    ),
                    child: const Icon(
                      Icons.my_location,
                      color: ColorManager.orangeLight,
                      size: 20,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 0,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.mapview);
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    margin: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: ColorManager.white,
                    ),
                    child: const Icon(
                      Icons.fullscreen,
                      color: ColorManager.orangeLight,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
