import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lottie/lottie.dart';
import 'package:shopack_user/core/utilities/routes.dart';
import 'package:shopack_user/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:shopack_user/features/cart/presentation/bloc/location_bloc.dart';
import 'package:shopack_user/features/cart/presentation/widgets/cart_item.dart';
import 'package:shopack_user/features/login/presentation/widgets/alert_snackbar.dart';
import '../../../../core/colors/colors.dart';
import '../../../../core/utilities/mediaquery.dart';
import '../../../../core/utilities/strings.dart';
import '../../../payment/presentation/bloc/payment_bloc.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  void initState() {
    
    BlocProvider.of<LocationBloc>(context).add(GetCurrentLocation());
    BlocProvider.of<PaymentBloc>(context)
                    .add(RequestAuth(dotenv.env['PAYMENT_API_KEY']!));
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            AppStrings.mybag,
            style: Theme.of(context).textTheme.headline6,
          )),
      floatingActionButton: BlocProvider.of<CartBloc>(context).cartItems.isEmpty
          ? const SizedBox()
          : SizedBox(
              width: kWidth(context) / 1.12,
              height: kHeight(context) / 14,
              child: FloatingActionButton.extended(
                  backgroundColor: ColorManager.orangeLight,
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  onPressed: () {
                    if (BlocProvider.of<CartBloc>(context)
                        .cartItems
                        .isNotEmpty) {
                      Navigator.pushNamed(context, AppRoutes.checkout);
                     
                          
                BlocProvider.of<PaymentBloc>(context).add(
                  RequestOrder(
                   BlocProvider.of<PaymentBloc>(context).PAYMOB_FIRST_TOKEN,
                    (BlocProvider.of<CartBloc>(context).totalAmount +
                            BlocProvider.of<LocationBloc>(context).delivery)
                        .toString(),
                  ),
                );
                    } else {
                      showSnackbar(AppStrings.emptybag, context, Colors.red);
                    }
                  },
                  label: BlocConsumer<CartBloc, CartState>(
                    listener: (context, state) {
                      if (state is AddToCartState) {
                        showSnackbar(
                            AppStrings.addedToCart, context, Colors.green);
                      }
                    },
                    builder: (context, state) {
                      return Text(
                        AppStrings.addToCart.toUpperCase(),
                      );
                    },
                  ),),
            ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                if (state is CartLoading) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: kHeight(context) / 10,
                              width: kWidth(context) / 10,
                              child: const CircularProgressIndicator()),
                        ],
                      ),
                    ],
                  );
                }
                if (state is CartLoaded) {
                  if (state.items.isEmpty) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Center(child: LottieBuilder.asset('assets/images/empty.json')),
                        ),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Text(AppStrings.notCart,style: Theme.of(context).textTheme.titleMedium,),
                         ),
                      ],
                    );
                  }
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(vertical: 22),
                          itemCount: state.items.length,
                          itemBuilder: (context, index) {
                            return CatItem(
                              item: state.items[index],
                              index: index,
                            );
                          },
                        ),
                      ),
                      SafeArea(
                        top: false,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 22),
                          width: double.infinity,
                          child: BlocBuilder<CartBloc, CartState>(
                            builder: (context, state) {
                              if (state is CartLoaded) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${state.items.length} items",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: ColorManager.orangeLight,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${AppStrings.totalAmount}: ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .copyWith(
                                                  color: ColorManager.grey),
                                        ),
                                        FittedBox(
                                          child: Text(
                                            '${BlocProvider.of<CartBloc>(context).totalAmount}  \$',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                );
                              }
                              return const SizedBox();
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: kHeight(context) / 12,
                      )
                    ],
                  );
                }

                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
