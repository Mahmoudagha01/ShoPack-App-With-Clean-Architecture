import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shopack_user/core/colors/colors.dart';
import '../../../../core/utilities/strings.dart';
import '../../../payment/domain/entities/all_orders_entity.dart';
import '../widgets/order_details_card.dart';

class OrderDetailsView extends StatelessWidget {
  final AllOrderEntity order;
  const OrderDetailsView({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: Text(
          AppStrings.orderdetails,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order ID: ${order.id}',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Items: ${order.orderItems.length}',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: ColorManager.orangeLight,
                        )),
                Row(
                  children: [
                    const Icon(Icons.schedule),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      DateFormat.yMMMEd().format(order.paidAt),
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
                '${AppStrings.deliveryAddress}: ${order.shippingInfo.address}'),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Status: PAID',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: ColorManager.green,
                        )),
                const SizedBox(
                  width: 6,
                ),
                Text("Method: PAYMOB",
                    style: Theme.of(context).textTheme.bodyMedium!)
              ],
            ),
            const Divider(),
            Text(
              'Order Items:',
              style: Theme.of(context).textTheme.headline6,
            ),
            Expanded(
              child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: order.orderItems.length,
                  itemBuilder: (context, index) => OrderDetailsCard(
                        order: order,
                        index: index,
                      )),
            ),
          ],
        ),
      ),
    );
  }
}
