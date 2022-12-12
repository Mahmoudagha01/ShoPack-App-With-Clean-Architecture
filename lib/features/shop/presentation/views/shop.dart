import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/colors/colors.dart';
import 'package:shop_app/core/utilities/strings.dart';
import 'package:shop_app/features/home/widgets/customGridView.dart';
import 'package:shop_app/features/home/widgets/product_item.dart';
import 'package:shop_app/features/shop/presentation/widgets/filter.dart';

import '../bloc/products_bloc.dart';

class ShopView extends StatelessWidget {
  const ShopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          AppStrings.shop,
          style: Theme.of(context).textTheme.headline5,
        ),
        leading: const FilterProduct(),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Container(
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 5,
                      color: ColorManager.grey,
                      spreadRadius: 2,
                    )
                  ],
                ),
                child: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.search))),
          ),
        ],
      ),
      body: SafeArea(
        child:
            BlocBuilder<ProductsBloc, ProductsState>(builder: (context, state) {
          final product = BlocProvider.of<ProductsBloc>(context);
          return Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: BlocProvider.of<ProductsBloc>(context)
                          .categories
                          .length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                product.add(ChangeCatyegory(index));
                                product.add(GetSpecificProduct(
                                    product.categories[index],
                                    '0',
                                    '100000',
                                    '0'));
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: const EdgeInsets.all(5),
                                width: 80,
                                height: 45,
                                decoration: BoxDecoration(
                                  color: product.current == index
                                      ? Colors.white70
                                      : Colors.white54,
                                  borderRadius: product.current == index
                                      ? BorderRadius.circular(15)
                                      : BorderRadius.circular(10),
                                  border: product.current == index
                                      ? Border.all(
                                          color: ColorManager.orangeLight,
                                          width: 2)
                                      : null,
                                ),
                                child: Center(
                                  child: FittedBox(
                                    child: Text(
                                      product.categories[index],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: product.current == index
                                              ? Colors.black
                                              : Colors.grey),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                ),
              ),
              BlocListener<ProductsBloc, ProductsState>(
                listener: (context, state) {},
                child: BlocBuilder<ProductsBloc, ProductsState>(
                  builder: (context, state) {
                    if (state is ProductsLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is ProductsLoadedState) {
                      final products = state.data.products;
                      return Expanded(
                          child: GridView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: state.data.filteredProductsCount,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                                height: 330, crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {},
                              child: ProductItem(product: products[index]));
                        },
                      ));
                    } else if (state is ProductsErrorState) {
                      return Center(child: Text(state.message));
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
