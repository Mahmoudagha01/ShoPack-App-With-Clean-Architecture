import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shopack_user/core/utilities/routes.dart';

import '../../../../core/colors/colors.dart';
import '../../../../core/utilities/mediaquery.dart';
import '../../../../core/utilities/strings.dart';
import '../../../payment/presentation/bloc/order_bloc.dart';

class OrderCard extends StatelessWidget {
  final int index;
  const OrderCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<OrderBloc>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        width: kWidth(context),
        height:kHeight(context)>=800? kHeight(context) / 6: kHeight(context) / 3.5,
        decoration: BoxDecoration( 
            color: ColorManager.white,
            boxShadow: kElevationToShadow[6],
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    DateFormat.yMMMEd().format(bloc.activeOrders[index].paidAt),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: ColorManager.dark,)
                  ),
                  Text('${bloc.activeOrders[index].itemsPrice} \$',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: ColorManager.dark,))
                ],
              ),
              Text(
                "Order ID #${bloc.activeOrders[index].id}",
                style: Theme.of(context).textTheme.labelSmall!.copyWith(color: ColorManager.dark,),
              ),
              Text("Shipping To : ${bloc.activeOrders[index].shippingInfo.city}"
                  .toUpperCase(),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: ColorManager.dark,)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.orderDetails,
                          arguments: bloc.activeOrders[index]);
                    },
                    child: const Text(AppStrings.viewdetails),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.circle,
                        color: ColorManager.green,
                        size: 12,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        "Processing",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(color: ColorManager.dark,)
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
