import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../core/colors/colors.dart';
import '../../../../core/utilities/mediaquery.dart';
import '../../../../core/utilities/routes.dart';
import '../../../../core/utilities/strings.dart';
import '../../../payment/presentation/bloc/order_bloc.dart';

class OrderCardPastOrders extends StatelessWidget {
  final int index;
  const OrderCardPastOrders({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
      final bloc = BlocProvider.of<OrderBloc>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        width: kWidth(context),
        height: kHeight(context) / 6,
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
                    DateFormat.yMMMEd().format(bloc.pastOrders[index].paidAt),
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Text('${bloc.pastOrders[index].itemsPrice} \$')
                ],
              ),
              Text(
                "Order ID #${bloc.pastOrders[index].id}",
                style: Theme.of(context).textTheme.labelSmall,
              ),
              Text("Shipping To : ${bloc.pastOrders[index].shippingInfo.city}"
                  .toUpperCase()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {
                       Navigator.pushNamed(context, AppRoutes.orderDetails,
                          arguments: bloc.pastOrders[index]);
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
                        "Delivered",
                        style: Theme.of(context).textTheme.bodySmall,
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
