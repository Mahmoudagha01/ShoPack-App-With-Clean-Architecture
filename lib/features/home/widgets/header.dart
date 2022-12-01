import 'package:flutter/material.dart';
import '../../../core/colors/colors.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.9,
      ),
      Positioned(
        top: MediaQuery.of(context).size.height * 0.4,
        left: 0,
        child: Image.asset("assets/images/laptop.jpg"),
      ),
      Positioned(
        bottom: 0,
        right: 0,
        child: Image.asset("assets/images/hod.png"),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.4,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/header.png"),
                fit: BoxFit.cover)),
      ),
      Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/opacity.png"),
                  fit: BoxFit.cover))),
      Positioned(
        top: MediaQuery.of(context).size.height * 0.3,
        left: 20,
        child: Text(
          "New Fashion Collection",
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(color: ColorManager.white),
        ),
      ),
      Positioned(
        bottom: 20,
        left: 30,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          height: 100,
          child: Text(
            "All this in one place",
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: ColorManager.orangeLight),
          ),
        ),
      ),
      Positioned(
        top: MediaQuery.of(context).size.height * 0.57,
        left: 20,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          height: 100,
          child: Text(
            "Electronics",
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: ColorManager.white),
          ),
        ),
      )
    ]);
  }
}
