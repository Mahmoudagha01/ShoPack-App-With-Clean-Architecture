import 'package:flutter/material.dart';
import 'package:shopack_user/core/colors/colors.dart';
import 'package:shopack_user/core/local/shared_preference.dart';
import 'package:shopack_user/core/utilities/mediaquery.dart';
import 'package:shopack_user/core/utilities/routes.dart';
import 'package:shopack_user/core/utilities/strings.dart';
import 'package:shopack_user/features/splash&onboarding/presentation/widgets/dots.dart';
import '../../data/models/onboarding.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late PageController controller;
  int currentPage = 0;

  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.onBoadingColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: controller,
                onPageChanged: (value) => setState(() => currentPage = value),
                itemCount: contents.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      children: [
                        const Spacer(),
                        Image.asset(
                          contents[i].image,
                          height: kHeight(context) / 3,
                        ),
                        SizedBox(
                          height: (kHeight(context) >= 840) ? 60 : 30,
                        ),
                        Text(
                          contents[i].title,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          contents[i].desc,
                          style: Theme.of(context).textTheme.titleMedium,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      contents.length,
                      (int index) => BulidDots(
                        index: index,
                        currentPage: currentPage,
                      ),
                    ),
                  ),
                  currentPage + 1 == contents.length
                      ? Padding(
                          padding: const EdgeInsets.all(30),
                          child: ElevatedButton(
                            onPressed: () {
                              PreferenceHelper.saveDataInSharedPreference(
                                  key: "IsSkippedOnBoarding", value: true);
                              Navigator.pushReplacementNamed(
                                  context, AppRoutes.splash);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              padding: (kWidth(context) <= 550)
                                  ? const EdgeInsets.symmetric(
                                      horizontal: 100, vertical: 20)
                                  : EdgeInsets.symmetric(
                                      horizontal: kWidth(context) * 0.2,
                                      vertical: 25),
                              textStyle: Theme.of(context).textTheme.bodyLarge,
                            ),
                            child: Text(AppStrings.start.toUpperCase()),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                         PreferenceHelper.saveDataInSharedPreference(
                                  key: "IsSkippedOnBoarding", value: true);
                              Navigator.pushReplacementNamed(
                                  context, AppRoutes.splash);
                                },
                                style: TextButton.styleFrom(
                                  elevation: 0,
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize:
                                        (kWidth(context) <= 550) ? 13 : 17,
                                  ),
                                ),
                                child: Text(
                                  AppStrings.skip.toUpperCase(),
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  controller.nextPage(
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.easeIn,
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorManager.dark,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  elevation: 0,
                                  padding: (kWidth(context) <= 550)
                                      ? const EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 20)
                                      : const EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 25),
                                  textStyle: TextStyle(
                                      fontSize:
                                          (kWidth(context) <= 550) ? 13 : 17),
                                ),
                                child: const Text(AppStrings.next),
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
