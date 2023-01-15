import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopack_user/features/cart/presentation/bloc/location_bloc.dart';
import '../../../../core/colors/colors.dart';
import '../../../../core/utilities/mediaquery.dart';

class DeliveryMethodCard extends StatefulWidget {
  final int index;

  const DeliveryMethodCard({
    super.key,
    required this.index,
  });

  @override
  State<DeliveryMethodCard> createState() => _DeliveryMethodCardState();
}

class _DeliveryMethodCardState extends State<DeliveryMethodCard> {
  int currentIndex = 0;
  List<Map<String, dynamic>> deliveryMethods = [
    {
      'image': 'assets/images/fedex.png',
      'title': '2-3 Days',
    },
    {
      'image': 'assets/images/dhl.png',
      'title': '1-3 Days',
    },
    {
      'image': 'assets/images/aramex.png',
      'title': '2-5 Days',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      InkWell(
        onTap: () {
          BlocProvider.of<LocationBloc>(context).add(SelectMethod(widget.index));
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: kElevationToShadow[4]),
          child: Column(
            children: [
              SizedBox(
                width: kWidth(context) / 2.5,
                height: kHeight(context) / 10,
                child: Image.asset(
                  deliveryMethods[widget.index]['image']!,
                  fit: BoxFit.fitWidth,
                ),
              ),
              FittedBox(child: Text(deliveryMethods[widget.index]['title']!))
            ],
          ),
        ),
      ),
      Positioned(
          right: 15,
          top: 10,
          child: BlocProvider.of<LocationBloc>(context).currentIndex==widget.index
              ? SizedBox(
                  width: 40,
                  height: 30,
                  child: Image.asset('assets/images/valid.png'),
                )
              : const SizedBox()),
    ]);
  }
}
