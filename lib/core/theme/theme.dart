import 'package:flutter/material.dart';
import 'package:smart_paper/core/theme/app_pallet.dart';

class AppTheme {
  static _border([Color color = AppPallete.borderColor]) => OutlineInputBorder(
        borderSide: BorderSide(
          width: 3,
          color: color,
        ),
        borderRadius: BorderRadius.circular(10),
      );
  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPallete.backgroundColor,
    appBarTheme: const AppBarTheme()
        .copyWith(backgroundColor: AppPallete.backgroundColor),
    inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(27),
        enabledBorder: _border(),
        focusedBorder: _border(AppPallete.gradient2)),
  );

  static final lightThemeMode = ThemeData();
}
