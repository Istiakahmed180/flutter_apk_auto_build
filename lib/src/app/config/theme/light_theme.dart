import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yumio/src/app/contants/app_colors.dart';

class LightTheme {
  ThemeData lightTheme(context) => ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      toolbarHeight: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.primary,
        systemNavigationBarColor: AppColors.primary,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    ),
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.background,
    fontFamily: "DM Sans",
  );
}
