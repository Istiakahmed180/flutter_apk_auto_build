import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumio/src/app/contants/app_colors.dart';
import 'package:yumio/src/app/contants/assets_path/png_assets.dart';
import 'package:yumio/src/common/controller/navigation_controller.dart';

class CustomNavigationItems extends StatefulWidget {
  const CustomNavigationItems({super.key});

  @override
  State<CustomNavigationItems> createState() => _CustomNavigationItemsState();
}

class _CustomNavigationItemsState extends State<CustomNavigationItems> {
  final navigationController = Get.find<NavigationController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Container(
          color: AppColors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildCustomNavItem(
                PngAssets.bottomNavigationHomeRawIcon,
                PngAssets.bottomNavigationHomeSolidIcon,
                'Home',
                0,
                25,
                25,
              ),
              _buildCustomNavItem(
                PngAssets.bottomNavigationFavoritesRawIcon,
                PngAssets.bottomNavigationFavoritesSolidIcon,
                'Favorites',
                1,
                25,
                25,
              ),
              _buildCustomNavItem(
                PngAssets.bottomNavigationSubscriptionRawIcon,
                PngAssets.bottomNavigationSubscriptionSolidIcon,
                'Subscription',
                2,
                25,
                25,
              ),
              _buildCustomNavItem(
                PngAssets.bottomNavigationSettingRawIcon,
                PngAssets.bottomNavigationSettingSolidIcon,
                'Settings',
                3,
                25,
                25,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCustomNavItem(
    String iconRawPath,
    String iconPath,
    String label,
    int index,
    double iconWidth,
    double iconHeight,
  ) {
    final isSelected = navigationController.selectedIndex.value == index;
    Widget iconWidget;
    Widget labelWidget;

    if (isSelected) {
      iconWidget = Image.asset(
        iconPath,
        width: iconWidth,
        height: iconHeight,
        fit: BoxFit.contain,
        color: AppColors.primary,
      );
    } else {
      iconWidget = Image.asset(
        iconRawPath,
        width: iconWidth,
        height: iconHeight,
        fit: BoxFit.contain,
        color: AppColors.grey2,
      );
    }

    if (isSelected) {
      labelWidget = Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: AppColors.primary,
        ),
      );
    } else {
      labelWidget = Text(
        label,
        style: TextStyle(
          color: AppColors.grey2,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      );
    }

    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => navigationController.onTapItem(index),
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 6),
                Visibility(
                  visible: isSelected,
                  child: Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                iconWidget,
                SizedBox(height: 4),
                labelWidget,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
