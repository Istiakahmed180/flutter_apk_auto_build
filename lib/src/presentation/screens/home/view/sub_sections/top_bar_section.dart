import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumio/src/app/contants/app_colors.dart';
import 'package:yumio/src/app/contants/assets_path/png_assets.dart';
import 'package:yumio/src/app/routes/routes.dart';
import 'package:yumio/src/common/controller/navigation_controller.dart';
import 'package:yumio/src/presentation/screens/home/controller/home_controller.dart';

class TopBarSection extends StatelessWidget {
  const TopBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => homeController.openDrawer(),
            child: Image.asset(PngAssets.commonMenuIcon, width: 24, height: 24),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              Get.find<NavigationController>().pushNamed(
                BaseRoute.notification,
              );
            },
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
          SizedBox(width: 8),
          GestureDetector(
            onTap: () => homeController.openEndDrawer(),
            child: Image.asset(PngAssets.avatarOne, width: 40, height: 40),
          ),
        ],
      ),
    );
  }
}
