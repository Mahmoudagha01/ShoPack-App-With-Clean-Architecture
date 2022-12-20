import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/colors/colors.dart';
import 'package:shop_app/core/utilities/strings.dart';
import 'package:shop_app/features/home/widgets/customGridView.dart';
import 'package:shop_app/features/home/widgets/product_item.dart';
import 'package:shop_app/features/shop/presentation/widgets/filter.dart';
import 'package:shop_app/features/shop/presentation/widgets/search.dart';

import '../../../home/presentation/view/product_details.dart';
import '../bloc/products_bloc.dart';

class ShopView extends StatelessWidget {
  const ShopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
            BlocBuilder<ProductsBloc, ProductsState>(builder: (context, state) {
          final bloc = BlocProvider.of<ProductsBloc>(context);
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const FilterProduct(),
                  Text(
                    AppStrings.shop,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SearchWidget()
                ],
              ),
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
                                bloc.add(ChangeCatyegory(index));
                                bloc.add(GetSpecificProduct(
                                    bloc.categories[index],
                                    '0',
                                    '100000',
                                    '-1',
                                    ''));
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: const EdgeInsets.all(5),
                                width: 80,
                                height: 45,
                                decoration: BoxDecoration(
                                  color: bloc.current == index
                                      ? Colors.white70
                                      : Colors.white54,
                                  borderRadius: bloc.current == index
                                      ? BorderRadius.circular(15)
                                      : BorderRadius.circular(10),
                                  border: bloc.current == index
                                      ? Border.all(
                                          color: ColorManager.orangeLight,
                                          width: 2)
                                      : null,
                                ),
                                child: Center(
                                  child: FittedBox(
                                    child: Text(
                                      bloc.categories[index],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: bloc.current == index
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
              BlocBuilder<ProductsBloc, ProductsState>(
                builder: (context, state) {
                  if (state is FilterProductsLoadingState || state is SpecificProductsLoadingState) {
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
                            onTap: () {
                          
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetails(
                                        product: products[index],
                                        products: products,
                                        index: index,),
                                  ));
                            },
                            child: Hero(
                              tag: '$index',
                              child: ProductItem(product: products[index])));
                      },
                    ));
                  } else if (state is ProductsErrorState) {
                    return Center(child: Text(state.message));
                  } else if (state is FilterProductsLoadedState) {
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
                            onTap: () {
                                   Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetails(
                                        product: products[index],
                                        products: products,
                                        index: index,),
                                  ));
                            },
                            child: Hero(
                              tag: '$index',
                              child: ProductItem(product: products[index])));
                      },
                    ));
                  } else if (state is ProductsErrorState) {
                    return Center(child: Text(state.message));
                  } else if (state is SpecificProductsLoadedState){
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
                            onTap: () {
                                   Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetails(
                                        product: products[index],
                                        products: products,
                                        index: index,),
                                  ));
                            },
                            child: Hero(
                              tag: '$index',
                              child: ProductItem(product: products[index])));
                      },
                    ));
                  }
                  
                  else {
                    return const SizedBox();
                  }
                },
              ),
            ],
          );
        }),
      ),
    );
  }
}
