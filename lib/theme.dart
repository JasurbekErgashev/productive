import 'package:flutter/material.dart';

class AppColors {
  static Color dark = const Color(0xFF131524);
  static Color blueMediumBlue = const Color(0xFF4B7FD6);
  static Color blueDarkBlue2 = const Color(0xFF1C233A);
  static Color blueBlueBlack = const Color(0xFF272C38);
  static Color white = const Color(0xFFFEFEFE);
  static Color grey = const Color(0xFFABABAB);
  static Color transparent = Colors.transparent;
}

class ProductiveTheme {
  static TextTheme productiveTextTheme = TextTheme(
    bodySmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    ),
    bodyLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: AppColors.white,
    ),
  );

  static ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.dark,
      //primaryColor: AppColors.primary,
      colorScheme: ColorScheme.fromSwatch(accentColor: AppColors.dark),
      splashColor: AppColors.blueMediumBlue,
      fontFamily: 'Barlow',
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all(AppColors.white),
        fillColor: MaterialStateProperty.all(AppColors.blueMediumBlue),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.dark,
        foregroundColor: AppColors.white,
        titleTextStyle: const TextStyle(
          fontSize: 32,
          //fontFamily: "Montserrat",
          fontWeight: FontWeight.w300,
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        elevation: 0,
        backgroundColor: AppColors.blueDarkBlue2,
        iconTheme: MaterialStatePropertyAll(
          IconThemeData(
            color: AppColors.white,
            size: 20,
          ),
        ),
        indicatorColor: AppColors.blueMediumBlue,
        indicatorShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        labelTextStyle: MaterialStatePropertyAll(
          TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.white,
          ),
        ),
      ),
      tabBarTheme: TabBarTheme(
        labelColor: AppColors.white,
        labelStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
        unselectedLabelColor: AppColors.grey,
        unselectedLabelStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            width: 2,
            color: AppColors.blueMediumBlue,
          ),
        ),
      ),
      badgeTheme: BadgeThemeData(
        backgroundColor: AppColors.blueMediumBlue,
        textStyle: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          color: AppColors.white,
        ),
      ),
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
      textTheme: productiveTextTheme,
    );
  }
}
