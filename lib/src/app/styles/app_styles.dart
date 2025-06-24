import 'package:flutter/material.dart';
import 'package:yumio/src/app/contants/app_colors.dart';

class AppStyles {
  // Linear Gradient
  static LinearGradient linearGradient() {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [AppColors.white, AppColors.white, AppColors.background],
      stops: const [0.0, 0.9, 1.0],
    );
  }
}
