import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/utilities/strings.dart';
import 'package:shop_app/features/home/widgets/header.dart';
import '../../../shop/presentation/bloc/products_bloc.dart';
import '../../widgets/customGridView.dart';
import '../../widgets/product_item_new.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HomeHeader(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  AppStrings.recentlyAddedProducts,
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'All Products >>',
                    )),
              ],
            ),
          ),
          BlocListener<ProductsBloc, ProductsState>(
            listener: (context, state) {},
            child: BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
                if (state is AllProductsLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is AllProductsLoadedState) {
                  final products = state.data.products.reversed.toList();
                  return Expanded(
                      child: GridView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: 10,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                            height: 330, crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {},
                          child: NewProductItem(product: products[index]));
                    },
                  ));
                } else if (state is AllProductsErrorState) {
                  return Center(child: Text(state.message));
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
