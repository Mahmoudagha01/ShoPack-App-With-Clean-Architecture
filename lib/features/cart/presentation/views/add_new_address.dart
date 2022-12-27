import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopack_user/core/utilities/mediaquery.dart';
import 'package:shopack_user/core/utilities/strings.dart';
import 'package:shopack_user/features/cart/presentation/bloc/location_bloc.dart';
import 'package:shopack_user/features/cart/presentation/widgets/mappreview.dart';

class AddNewAddressView extends StatelessWidget {
  const AddNewAddressView({super.key});

  @override
  Widget build(BuildContext context) {
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
          AppStrings.addnewaddress,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            AppStrings.yourCurrentLocation,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          BlocBuilder<LocationBloc, LocationState>(
          
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
                return Column(
                  children: [
                    MapPreview(bloc: bloc),
                    // Text( '${bloc.currentAddress!.streetAddress!} - ${bloc.currentAddress!.city!} - ${bloc.currentAddress!.region!} - ${bloc.currentAddress!.countryName!}')
                  ],
                );
              } else if (state is MapErrorState) {
                return Center(child: Text(state.message));
              } else {
                return const SizedBox();
              }
            },
          )
        ]),
      ),
    );
  }
}
