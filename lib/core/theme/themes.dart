

import 'package:flutter/material.dart';

import '../resources/app_resources.dart';


part 'text_theme.dart';
part 'button_theme.dart';
part 'input_theme.dart';

class Themes {

  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primaryColor,
        secondary: AppColors.secondaryColor,
        surface: AppColors.backgroundColor,
      ),
      brightness: Brightness.dark,
      textTheme: TextThemeStyle.dark,
      inputDecorationTheme: InputTheme.dark,
      elevatedButtonTheme: ButtonThemeStyle.elevatedButtonTheme,
      outlinedButtonTheme: ButtonThemeStyle.outlinedButtonDarkTheme,
      appBarTheme: const AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
        selectedItemColor: AppColors.secondaryColor,
        unselectedItemColor: AppColors.accentBlack,
      ),
    cardTheme: const CardTheme(
      color: AppColors.accentBlack
    )

  );
}