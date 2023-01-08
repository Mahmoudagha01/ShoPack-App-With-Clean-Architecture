import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:shopack_user/core/utilities/strings.dart';
import 'package:shopack_user/features/profile/presentation/widgets/order_card.dart';
import 'package:shopack_user/features/profile/presentation/widgets/order_cardpastOrders.dart';
import '../../../payment/presentation/bloc/order_bloc.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios)),
          title: Text(
            AppStrings.myOrders,
            style: Theme.of(context).textTheme.headline6,
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: AppStrings.activeOrders,
              ),
              Tab(
                text: AppStrings.deliveredOrders,
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            BlocBuilder<OrderBloc, OrderState>(
              builder: (context, state) {
                final bloc = BlocProvider.of<OrderBloc>(context);
                if (state is AllOrdersLoaded) {
                  return  bloc.activeOrders.isEmpty? LottieBuilder.asset('assets/images/empty.json') :ListView.builder(
                    itemCount: bloc.activeOrders.length,
                    itemBuilder: (context, index) => OrderCard(index: index)
                  );
                } else if (state is AllOrdersLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is AllOrdersError) {
                  return Text(state.message);
                } else {
                  return const SizedBox();
                }
              },
            ),
            BlocBuilder<OrderBloc, OrderState>(
              builder: (context, state) {
                final bloc = BlocProvider.of<OrderBloc>(context);
                if (state is AllOrdersLoaded) {
                  return bloc.pastOrders.isEmpty? LottieBuilder.asset('assets/images/empty.json') :ListView.builder(
                    itemCount: bloc.pastOrders.length,
                    itemBuilder: (context, index) => OrderCardPastOrders(index: index)
                  );
                } else if (state is AllOrdersLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is AllOrdersError) {
                  return Text(state.message);
                } else {
                  return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
