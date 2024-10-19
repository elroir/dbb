part of 'themes.dart';

class ChipTheme{
  static const dark = ChipThemeData(
      shape: StadiumBorder(),
      elevation: 0,
      color: WidgetStatePropertyAll(AppColors.primary),
      backgroundColor: AppColors.primary,
      labelStyle: TextStyle(color: Colors.black)
  );
}