import 'package:flutter/material.dart';
import '../../../../core/colors/colors.dart';
import '../../../../core/utilities/mediaquery.dart';
import '../../../payment/domain/entities/all_orders_entity.dart';

class OrderDetailsCard extends StatelessWidget {
  final int index;
  final AllOrderEntity order;
  const OrderDetailsCard({super.key, required this.index, required this.order});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kWidth(context),
      height: kHeight(context) / 8,
      child: Row(
        children: [
          Container(
            width: kWidth(context) / 4,
            height: kHeight(context) / 9,
            decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: NetworkImage(order.orderItems[index].image))),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: kWidth(context) / 2,
                  height: 30,
                  child: Text(
                    order.orderItems[index].name,
                    overflow: TextOverflow.clip,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: kWidth(context) / 2.5,
                      child: Text(
                        '${order.orderItems[index].price} \$',
                        overflow: TextOverflow.clip,
                      ),
                    ),
                    SizedBox(
                        child: FittedBox(
                            child: Text(
                                'Quantity: ${order.orderItems[index].quantity} '))),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
