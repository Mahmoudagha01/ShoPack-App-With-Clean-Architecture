import 'package:flutter/material.dart';

import '../../../../core/utilities/strings.dart';


class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
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
        
        ],
      ),
    );
  }
}
