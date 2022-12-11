import 'package:flutter/material.dart';
import 'package:shop_app/core/utilities/strings.dart';
import 'package:shop_app/features/login/presentation/widgets/mainbutton.dart';
import '../../../core/colors/colors.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/header.png"),
                fit: BoxFit.cover)),
      ),
      Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/opacity.png"),
                  fit: BoxFit.cover))),
      Positioned(
        top: MediaQuery.of(context).size.height * 0.25,
        left: 20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.headerTitle,
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: ColorManager.white),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              AppStrings.headerSuTitle,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: ColorManager.white.withOpacity(0.9),
                  ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                width: 200,
                child: MainButton(
                    text: AppStrings.check, height: 40, ontab: () {}))
          ],
        ),
      ),
    ]);
  }
}
