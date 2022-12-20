import 'package:flutter/material.dart';
import 'package:shopack_user/core/colors/colors.dart';


ThemeData lightTheme() {
  return ThemeData(
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
  );
}
