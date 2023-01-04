import 'package:shopack_user/core/utilities/strings.dart';

class OnBoardingContents {
  final String title;
  final String image;
  final String desc;

  OnBoardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnBoardingContents> contents = [
  OnBoardingContents(
    title: AppStrings.onBoardingTitle1,
    image: "assets/images/1.png",
    desc:
        AppStrings.onBoardingSubTitle1,
  ),
  OnBoardingContents(
    title: AppStrings.onBoardingTitle2,
    image: "assets/images/sale.png",
    desc: AppStrings.onBoardingSubTitle2,
  ),
  OnBoardingContents(
    title: AppStrings.onBoardingTitle3,
    image: "assets/images/payment.png",
    desc: AppStrings.onBoardingSubTitle3,
  ),
  OnBoardingContents(
    title: AppStrings.onBoardingTitle4,
    image: "assets/images/delivery.png",
    desc:
        AppStrings.onBoardingSubTitle4,
  ),
];
