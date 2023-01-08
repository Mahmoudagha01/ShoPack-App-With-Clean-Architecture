import 'package:flutter/material.dart';
import 'package:shopack_user/core/colors/colors.dart';
import '../utilities/enums.dart';

final appThemeData = {
  AppTheme.lightTheme: ThemeData(
    brightness: Brightness.light,
    iconTheme: const IconThemeData(color: ColorManager.orangeLight),
    focusColor: ColorManager.orangeLight,
    primaryColorLight: ColorManager.orangeLight,
    fontFamily: "Roboto",
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorManager.light,
      iconTheme: IconThemeData(
        color: ColorManager.dark,
      ),
    ),
    scaffoldBackgroundColor: ColorManager.light,
    bottomSheetTheme:
        const BottomSheetThemeData(backgroundColor: ColorManager.light),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorManager.white,
      elevation: 0.3,
      selectedItemColor: ColorManager.orangeLight,
      selectedIconTheme: IconThemeData(color: ColorManager.orangeLight),
      unselectedIconTheme: IconThemeData(color: ColorManager.grey),
      unselectedItemColor: ColorManager.grey,
    ),
    textSelectionTheme:
        const TextSelectionThemeData(cursorColor: ColorManager.dark),
    inputDecorationTheme: const InputDecorationTheme(
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.orangeLight),
      ),
      prefixIconColor: ColorManager.orangeLight,
      filled: true,
      fillColor: ColorManager.white,
      labelStyle: TextStyle(color: ColorManager.grey, height: 4, fontSize: 20),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorManager.orangeLight,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(ColorManager.orangeLight),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(ColorManager.orangeLight),
      ),
    ),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: ColorManager.orangeLight),
    buttonTheme: const ButtonThemeData(buttonColor: ColorManager.orangeLight),
    indicatorColor: ColorManager.orangeLight,
    tabBarTheme: TabBarTheme(
        overlayColor: MaterialStateProperty.all(
            ColorManager.orangeLight.withOpacity(0.1)),
        labelColor: ColorManager.orangeLight,
        unselectedLabelColor: ColorManager.grey),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(ColorManager.orangeLight),
        overlayColor: MaterialStateProperty.all(
            ColorManager.orangeLight.withOpacity(0.1)),
      ),
    ),
  ),
  AppTheme.darkTheme: ThemeData(
    textTheme: const TextTheme(
        subtitle1: TextStyle(color: ColorManager.light),
        subtitle2: TextStyle(color: ColorManager.dark)),
    brightness: Brightness.dark,
    iconTheme: const IconThemeData(color: ColorManager.orangeDark),
    focusColor: ColorManager.orangeDark,
    primaryColorLight: ColorManager.orangeDark,
    fontFamily: "Roboto",
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorManager.dark,
      iconTheme: IconThemeData(
        color: ColorManager.light,
      ),
    ),
    cardColor:ColorManager.green ,
    scaffoldBackgroundColor: ColorManager.dark,
    bottomSheetTheme:
        const BottomSheetThemeData(backgroundColor: ColorManager.dark),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorManager.dark,
      elevation: 0.3,
      selectedItemColor: ColorManager.orangeDark,
      selectedIconTheme: IconThemeData(color: ColorManager.orangeDark),
      unselectedIconTheme: IconThemeData(color: ColorManager.grey),
      unselectedItemColor: ColorManager.white,
    ),
    textSelectionTheme:
        const TextSelectionThemeData(cursorColor: ColorManager.light),
    inputDecorationTheme: const InputDecorationTheme(
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.light),
      ),
      prefixIconColor: ColorManager.orangeDark,
      filled: true,
      fillColor: ColorManager.dark,
      labelStyle: TextStyle(color: ColorManager.white, height: 4, fontSize: 20),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorManager.orangeDark,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(ColorManager.orangeDark),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(ColorManager.orangeDark),
      ),
    ),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: ColorManager.orangeDark),
    buttonTheme: const ButtonThemeData(buttonColor: ColorManager.orangeDark),
    indicatorColor: ColorManager.orangeDark,
    tabBarTheme: TabBarTheme(
        overlayColor:
            MaterialStateProperty.all(ColorManager.orangeDark.withOpacity(0.1)),
        labelColor: ColorManager.orangeDark,
        unselectedLabelColor: ColorManager.grey),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        side: MaterialStateProperty.all(
            const BorderSide(color: ColorManager.orangeDark)),
        foregroundColor: MaterialStateProperty.all(ColorManager.orangeDark),
        overlayColor:
            MaterialStateProperty.all(ColorManager.orangeDark.withOpacity(0.1)),
      ),
    ),
  ),
};
