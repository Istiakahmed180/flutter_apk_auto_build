import 'package:flutter/material.dart';
import 'package:yumio/src/app/contants/app_colors.dart';
import 'package:yumio/src/app/contants/assets_path/png_assets.dart';
import 'package:yumio/src/common/widgets/common_back_button.dart';

class CommonTopBar extends StatelessWidget {
  final GestureTapCallback onPressed;
  final GestureTapCallback? rightSideOnPressed;
  final String title;
  final bool? isShowRightSideIcon;
  final Color? backButtonBgColor;

  const CommonTopBar({
    super.key,
    required this.title,
    required this.onPressed,
    this.isShowRightSideIcon = true,
    this.rightSideOnPressed,
    this.backButtonBgColor = AppColors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonBackButton(
            onTap: onPressed,
            backgroundColor: backButtonBgColor!,
          ),
          Transform.translate(
            offset: Offset(isShowRightSideIcon == false ? -12 : 0, 0),
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          Visibility(
            visible: isShowRightSideIcon == true,
            child: GestureDetector(
              onTap: rightSideOnPressed,
              child: Badge(
                backgroundColor: AppColors.primary,
                smallSize: 7,
                child: Image.asset(
                  PngAssets.commonNotificationIcon,
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
