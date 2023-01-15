import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:shopack_user/features/favorite/presentation/bloc/favourite_bloc.dart';
import 'package:shopack_user/features/home/widgets/customGridView.dart';
import 'package:shopack_user/features/home/widgets/product_item.dart';
import '../../../../core/utilities/strings.dart';


class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  @override
  Widget build(BuildContext context) {
    final favouriteList = BlocProvider.of<FavouriteBloc>(context).favouriteList;
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            AppStrings.favorite,
            style: Theme.of(context).textTheme.headline6,
          )),
      body: Column(
        children: [
          Expanded(
              child: favouriteList.isEmpty
                  ? Column(
                    children: [
                      Expanded(
                        child: Center(child: LottieBuilder.asset('assets/images/empty.json')),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(AppStrings.notfavorite,style: Theme.of(context).textTheme.titleMedium,),
                      )
                    ],
                  )
                  : RefreshIndicator(
                    onRefresh: () async{
               setState(() {
                 
               });
                    },
                    child: GridView.builder(
                      itemCount: favouriteList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                                crossAxisCount: 2, height: 330),
                        itemBuilder: (context, index) {
                          return ProductItem(product: favouriteList[index]);
                        },
                      ),
                  ))
        ],
      ),
    );
  }
}
