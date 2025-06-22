import 'package:flutter/material.dart';

import 'colors_helper.dart';

class ThemesHelper {
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'roboto',
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorsHelper.primaryColor,
      selectionHandleColor: ColorsHelper.primaryColor,
      selectionColor: ColorsHelper.primaryColor.withValues(alpha: 0.2),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedItemColor: ColorsHelper.secondaryGray,
      selectedItemColor: ColorsHelper.primaryColor,
      // selectedLabelStyle: AppTextStyles.cairoPrimaryBold12,
      backgroundColor: Colors.white,
      selectedIconTheme: IconThemeData(color: ColorsHelper.primaryColor),
    ),
    appBarTheme: const AppBarTheme(
      color: ColorsHelper.white,
      surfaceTintColor: ColorsHelper.white,
    ),
    scaffoldBackgroundColor: ColorsHelper.homeScaffoldColor,
    primaryColor: ColorsHelper.primaryColor,
    canvasColor: Colors.white,
    splashColor: ColorsHelper.transparent,
    textButtonTheme: const TextButtonThemeData(
      // style: ButtonStyle(
      //     textStyle: WidgetStatePropertyAll(AppTextStyles.cairoBlackBold13
      //         .copyWith(color: ColorsHelper.black))),
    ),
    dialogTheme: const DialogThemeData(
      backgroundColor: ColorsHelper.white,
      // titleTextStyle: AppTextStyles.cairoBlackBold13,
      surfaceTintColor: ColorsHelper.white,
    ),
  );
}
