import 'package:flutter/material.dart';
import 'package:smart_paper/core/theme/app_pallet.dart';

class AppTheme {
  static _border([Color color = AppPalleteLight.borderColor]) =>
      OutlineInputBorder(
        borderSide: BorderSide(
          width: 3,
          color: color,
        ),
        borderRadius: BorderRadius.circular(10),
      );

  static final lightThemeMode = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppPalleteLight.backgroundColor,
    primaryColor: AppPalleteLight.primaryColor,
    appBarTheme: const AppBarTheme()
        .copyWith(backgroundColor: AppPalleteLight.backgroundColor),
    inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(27),
        enabledBorder: _border(),
        focusedBorder: _border(AppPalleteLight.primaryColor)),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppPalleteLight.blackColor),
      bodyMedium: TextStyle(color: AppPalleteLight.greyColor),
    ),
  );

  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPallete.backgroundColor,
    appBarTheme: const AppBarTheme()
        .copyWith(backgroundColor: AppPallete.backgroundColor),
    inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(27),
        enabledBorder: _border(AppPallete.borderColor),
        focusedBorder: _border(AppPallete.gradient2)),
  );
}
