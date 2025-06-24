import 'package:flutter/material.dart';
import 'package:yumio/src/app/contants/app_colors.dart';
import 'package:yumio/src/app/contants/assets_path/png_assets.dart';

class CommonBackButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final Color backgroundColor;

  const CommonBackButton({
    super.key,
    required this.onTap,
    this.backgroundColor = AppColors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.border),
        ),
        child: Image.asset(PngAssets.commonLeftArrowIcon),
      ),
    );
  }
}
