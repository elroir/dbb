part of 'themes.dart';

class InputTheme{

  static const dark = InputDecorationTheme(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppBorder.inputBorder))
      ),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppBorder.inputBorder)),
       borderSide: BorderSide(color: Colors.red)
    ),
    errorStyle: TextStyle(color: Colors.red),
    hintStyle: TextStyle(color: AppColors.primary)
  );

}