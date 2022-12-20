import 'package:flutter/material.dart';
import 'package:shop_app/core/utilities/strings.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        AppStrings.favorite,
        style: Theme.of(context).textTheme.headline6,
      )),
      body: Column(
        children: [
          Text("Favorite"),
        ],
      ),
    );
  }
}
