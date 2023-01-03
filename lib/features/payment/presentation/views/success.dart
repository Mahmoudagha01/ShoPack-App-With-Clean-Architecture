
import 'package:flutter/material.dart';
import 'package:shopack_user/core/utilities/mediaquery.dart';
import 'package:shopack_user/core/utilities/routes.dart';
import 'package:shopack_user/core/utilities/strings.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        width: kWidth(context)/1.12,
        height: kHeight(context) / 12,
        child: FloatingActionButton.extended(
            onPressed: () {
              Navigator.pushReplacementNamed(context, AppRoutes.layout);
            },
            label: const Text(AppStrings.continueShopping)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset('assets/images/success.png'),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "${AppStrings.success}!",
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(AppStrings.successMsg,
              style: Theme.of(context).textTheme.bodyMedium)
        ],
      ),
    );
  }
}
