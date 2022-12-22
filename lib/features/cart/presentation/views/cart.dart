import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:shopack_user/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:shopack_user/features/cart/presentation/widgets/cart_item.dart';
import 'package:shopack_user/features/login/presentation/widgets/mainbutton.dart';
import '../../../../core/colors/colors.dart';
import '../../../../core/utilities/mediaquery.dart';
import '../../../../core/utilities/strings.dart';
import '../../../login/presentation/widgets/alert_snackbar.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  void initState() {
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
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                if (state is CartLoading) {
                  return const CircularProgressIndicator();
                }
                if (state is CartLoaded) {
                  if (state.items.isEmpty) {
                    return Column(
                      children: [
                        LottieBuilder.asset('assets/images/empty.json'),
                        const Text(AppStrings.notCart),
                      ],
                    );
                  }
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 22),
                    itemCount: state.items.length,
                    itemBuilder: (context, index) {
                      return CatItem(item: state.product!);
                    },
                  );
                }

                return const SizedBox();
              },
            ),
          ),
          SafeArea(
            top: false,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${AppStrings.totalAmount}: ",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(color: ColorManager.grey),
                            ),
                            Text(
                              '${state.totalPrice}  \$',
                              style: Theme.of(context).textTheme.headline6,
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: MainButton(
                text: AppStrings.checkout.toUpperCase(),
                ontab: () {},
                height: 50),
          )
        ],
      ),
    );
  }
}
