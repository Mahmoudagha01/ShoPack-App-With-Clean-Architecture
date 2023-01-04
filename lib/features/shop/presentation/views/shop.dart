import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:shopack_user/core/utilities/mediaquery.dart';
import 'package:shopack_user/core/utilities/strings.dart';
import '../../../../core/colors/colors.dart';
import '../../../home/presentation/view/product_details.dart';
import '../../../home/widgets/customGridView.dart';
import '../../../home/widgets/product_item.dart';
import '../bloc/products_bloc.dart';
import '../widgets/filter.dart';
import '../widgets/search.dart';

class ShopView extends StatelessWidget {
  const ShopView({super.key});

  @override
  Widget build(BuildContext context) {
    int current = 0;
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<ProductsBloc>(context).add(GetSpecificProduct(
              BlocProvider.of<ProductsBloc>(context).categories[current],
              '0',
              '100000',
              '-1',
              ''));
        },
        child: SafeArea(
          child: BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
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
                                  current = index;
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  margin: const EdgeInsets.all(5),
                                  width: 80,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color:  Colors.white70,
                                        
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
                    if (state is FilterProductsLoadingState ||
                        state is SpecificProductsLoadingState) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: kHeight(context) / 3,
                          ),
                          const CircularProgressIndicator(),
                        ],
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
                                        index: index,
                                      ),
                                    ));
                              },
                              child: Hero(
                                  tag: '$index',
                                  child:
                                      ProductItem(product: products[index])));
                        },
                      ));
                    } else if (state is ProductsErrorState ) {
                      return state.message == AppStrings.noInternetError
                    ? Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            child: Card(child: LottieBuilder.asset('assets/images/nointernet.json')),
                          ),
                          Card(child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(state.message),
                          ))
                        ],
                      )
                    : Center(child: Text(state.message));
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
                                        index: index,
                                      ),
                                    ));
                              },
                              child: Hero(
                                  tag: '$index',
                                  child:
                                      ProductItem(product: products[index])));
                        },
                      ));
                    
                    } else if (state is SpecificProductsLoadedState) {
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
                                        index: index,
                                      ),
                                    ));
                              },
                              child: Hero(
                                  tag: '$index',
                                  child:
                                      ProductItem(product: products[index])));
                        },
                      ));
                    } else if (state is SpecificProductsErrorState ) {
                      return state.message == AppStrings.noInternetError
                    ? Column(
                        children: [
                          Padding(
                            
                            padding: const EdgeInsets.symmetric(vertical: 14,horizontal: 19),
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              child: LottieBuilder.asset('assets/images/nointernet.json')),
                          ),
                          Card(child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(state.message),
                          ))
                        ],
                      )
                    : Center(child: Text(state.message));
                    }  else {
                      return const SizedBox();
                    }
                  },
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
