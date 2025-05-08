import 'package:flutter/material.dart';
import 'package:tracking_app/core/utils/app_text_styles.dart';
import 'package:tracking_app/core/utils/colors.dart';

abstract class ApplicationTheme {
  static ThemeData themeData = ThemeData(
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        fontFamily: "Inter",
        fontWeight: FontWeight.w500,
        fontSize: 20,
        color: PalletsColors.blackBase,
      ),
      centerTitle: false,
    ),
    textTheme: const TextTheme(
      bodySmall: TextStyle(
        fontFamily: "Inter",
        fontSize: 12,
        color: PalletsColors.gray,
      ),
      titleMedium: TextStyle(fontSize: 20, color: PalletsColors.blackBase),
      labelMedium: TextStyle(
        fontFamily: "Inter",
        fontSize: 16,
        color: PalletsColors.whiteBase,
      ),
      displayMedium: TextStyle(
        fontFamily: "Roboto",
        fontSize: 20,
        color: PalletsColors.blackBase,
      ),
      labelSmall: TextStyle(
        fontFamily: "Inter",
        fontSize: 13,
        color: PalletsColors.whiteBase,
      ),
      bodyMedium: TextStyle(fontSize: 14, color: PalletsColors.blackBase),
      headlineMedium: TextStyle(
        fontFamily: "Inter",
        fontSize: 16,
        color: PalletsColors.blackBase,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15),
        backgroundColor: PalletsColors.mainColorBase,
        foregroundColor: PalletsColors.whiteBase,
        disabledBackgroundColor: PalletsColors.gray,
        disabledForegroundColor: PalletsColors.whiteBase,
        textStyle: const TextStyle(
          fontFamily: "Inter",
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        minimumSize: const Size(double.infinity, 48),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(foregroundColor: PalletsColors.gray),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: PalletsColors.mainColorBase,
      unselectedItemColor: PalletsColors.white80,
      selectedLabelStyle: TextStyle(fontSize: 12),
    ),
  );
}
