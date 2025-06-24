import 'package:delightful_toast/delight_toast.dart';
import 'package:flutter/material.dart';
import 'package:yumio/src/app/contants/app_colors.dart';
import 'package:yumio/src/app/contants/assets_path/png_assets.dart';

enum ToastType { success, error, info }

void showAppToast({
  required BuildContext context,
  required String message,
  required ToastType type,
  Duration duration = const Duration(seconds: 2),
  double? margin = 0.24,
}) {
  String iconPath;
  Color backgroundColor;

  switch (type) {
    case ToastType.success:
      iconPath = PngAssets.savedSuccessfulAlert;
      backgroundColor = AppColors.black;
      break;
    case ToastType.error:
      iconPath = PngAssets.errorMessage;
      backgroundColor = AppColors.black;
      break;
    case ToastType.info:
      iconPath = PngAssets.alertMessage;
      backgroundColor = AppColors.black;
      break;
  }

  DelightToastBar(
    autoDismiss: true,
    snackbarDuration: duration,
    builder:
        (context) => Container(
          margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * margin!,
          ),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(50),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(iconPath, width: 24, height: 24),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  message,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    color: AppColors.white,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: () => DelightToastBar.removeAll(),
                child: Image.asset(
                  PngAssets.commonCloseIcon,
                  width: 14,
                  height: 14,
                ),
              ),
            ],
          ),
        ),
  ).show(context);
}
