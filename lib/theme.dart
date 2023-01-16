import 'package:flutter/material.dart';

class AppColors {
  static Color dark = const Color(0xFF131524);
  static Color blueMediumBlue = const Color(0xFF4B7FD6);
  static Color white = const Color(0xFFFEFEFE);
}

class ProductiveTheme {
  static TextTheme productiveTextTheme = const TextTheme(
      // bodyText1: TextStyle(
      //   fontSize: 32,
      //   fontWeight: FontWeight.w300,
      //   color: AppColors.white2,
      // ),
      // bodyText2: TextStyle(
      //   fontSize: 24,
      //   color: AppColors.white,
      // ),
      // button: TextStyle(
      //   fontSize: 14,
      //   fontWeight: FontWeight.w700,
      //   color: AppColors.primary,
      // ),
      // headline2: TextStyle(
      //   fontSize: 20,
      //   color: AppColors.white,
      // ),
      // headline3: TextStyle(
      //   fontSize: 16,
      //   color: AppColors.white2,
      // ),
      // headline4: TextStyle(
      //   fontSize: 12.0,
      //   color: AppColors.white3,
      // ),
      // headline5: TextStyle(
      //   fontSize: 10.0,
      //   height: 1.1,
      //   fontWeight: FontWeight.w700,
      //   color: AppColors.primary,
      // ),
      // headline6: TextStyle(
      //   fontSize: 16,
      //   height: 1.1,
      //   color: AppColors.white,
      // ),
      );

  static ThemeData theme() {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.dark,
      //primaryColor: AppColors.primary,
      colorScheme: ColorScheme.fromSwatch(accentColor: AppColors.dark),
      fontFamily: 'Barlow',
      //appBarTheme: AppBarTheme(
      //  backgroundColor: AppColors.primary,
      //  foregroundColor: AppColors.white2,
      //  titleTextStyle: const TextStyle(
      //    fontSize: 32,
      //    fontFamily: "Montserrat",
      //    fontWeight: FontWeight.w300,
      //  ),
      //),
      //dialogTheme: DialogTheme(
      //backgroundColor: AppColors.secondary,
      // titleTextStyle: TextStyle(
      //   fontFamily: 'Montserrat',
      //   fontSize: 18,
      //   fontWeight: FontWeight.w600,
      //   color: AppColors.white,
      // ),
      // contentTextStyle: TextStyle(
      //   fontFamily: 'Montserrat',
      //   color: AppColors.white,
      // ),
      //),
      //textTheme: productiveTextTheme,
    );
  }
}
