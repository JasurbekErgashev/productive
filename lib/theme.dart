import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();
  static const Color dark = Color(0xFF131524);
  static const Color blueMediumBlue = Color(0xFF4B7FD6);
  static final Color blueMediumBlueOpac32 = blueMediumBlue.withOpacity(0.32);
  static const Color blueDarkBlue2 = Color(0xFF1C233A);
  static const Color blueBlueBlack = Color(0xFF272C38);
  static const Color white = Color(0xFFFEFEFE);
  static final Color whiteOpac20 = white.withOpacity(0.2);
  static final Color whiteOpac50 = white.withOpacity(0.5);
  static const Color grey = Color(0xFFABABAB);
  static const Color transparent = Colors.transparent;
  static const Color red = Colors.red;
  static final Color blueOpac1 = const Color(0xFF006EE9).withOpacity(0.1);
  static final Color blueOpac5 = const Color(0xFF006EE9).withOpacity(0.5);
}

class AppTypography {
  const AppTypography._();
  static const TextStyle onbButtonStyle = TextStyle(
    color: AppColors.blueMediumBlue,
    fontWeight: FontWeight.w400,
    fontSize: 20,
  );
  static const TextStyle onbTitleStyle = TextStyle(
    color: AppColors.white,
    fontWeight: FontWeight.w600,
    fontSize: 24,
  );
  static final TextStyle onbSubTitleStyle = TextStyle(
    color: AppColors.whiteOpac50,
    fontWeight: FontWeight.w400,
    fontSize: 18,
  );
  static const TextStyle pBlueMediumBlue = TextStyle(
    color: AppColors.blueMediumBlue,
    fontWeight: FontWeight.w400,
    fontSize: 12,
  );
  static const TextStyle p = TextStyle(
    color: AppColors.white,
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );
  static final TextStyle pNormal = p.copyWith(
    fontWeight: FontWeight.w500,
  );
  static final TextStyle pNormalBlueMediumBlue = pNormal.copyWith(
    color: AppColors.blueMediumBlue,
  );
  static final TextStyle pWhiteOpac50 = p.copyWith(
    color: AppColors.whiteOpac50,
  );
}

class ProductiveTheme {
  // static TextTheme productiveTextTheme = TextTheme(
  //   bodySmall: TextStyle(
  //     fontSize: 14,
  //     fontWeight: FontWeight.w400,
  //     color: AppColors.white,
  //   ),
  //   bodyMedium: TextStyle(
  //     fontSize: 16,
  //     fontWeight: FontWeight.w500,
  //     color: AppColors.white,
  //   ),
  //   bodyLarge: TextStyle(
  //     fontSize: 20,
  //     fontWeight: FontWeight.w700,
  //     color: AppColors.white,
  //   ),
  // );

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
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.dark,
        foregroundColor: AppColors.white,
        titleTextStyle: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w300,
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        elevation: 0,
        backgroundColor: AppColors.blueDarkBlue2,
        iconTheme: const MaterialStatePropertyAll(
          IconThemeData(
            color: AppColors.white,
            size: 20,
          ),
        ),
        indicatorColor: AppColors.blueMediumBlue,
        indicatorShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        labelTextStyle: const MaterialStatePropertyAll(
          TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.white,
          ),
        ),
      ),
      tabBarTheme: const TabBarTheme(
        labelColor: AppColors.white,
        labelStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
        unselectedLabelColor: AppColors.grey,
        unselectedLabelStyle: TextStyle(
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
      // badgeTheme: const BadgeThemeData(
      //   backgroundColor: AppColors.blueMediumBlue,
      //   textStyle: TextStyle(
      //     fontSize: 10,
      //     fontWeight: FontWeight.w500,
      //     color: AppColors.white,
      //   ),
      // ),
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
    );
  }
}
