import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumio/src/app/contants/app_colors.dart';
import 'package:yumio/src/app/contants/assets_path/png_assets.dart';
import 'package:yumio/src/presentation/screens/home/controller/home_controller.dart';

class EndDrawerSection extends StatelessWidget {
  EndDrawerSection({super.key});

  final HomeController _homeController = Get.find();
  final List<Map<String, dynamic>> _navigationList = [
    {"name": "Edit Profile", "icon": PngAssets.endDrawerEditProfileIcon},
    {"name": "Change Password", "icon": PngAssets.endDrawerChangePasswordIcon},
    {"name": "Favorites", "icon": PngAssets.endDrawerFavoriteIcon},
    {"name": "All Notification", "icon": PngAssets.endDrawerNotificationIcon},
    {"name": "Help & Support", "icon": PngAssets.endDrawerHelpAndSupportIcon},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Stack(
        clipBehavior: Clip.none,
        children: [_buildDrawerContent(context), _buildCloseButton()],
      ),
    );
  }

  Widget _buildDrawerContent(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.85,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      backgroundColor: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          _UserInfoSection(),
          const SizedBox(height: 30),
          Divider(height: 0, color: AppColors.border, indent: 30),
          const SizedBox(height: 40),
          _NavigationItemsSection(
            navigationList: _navigationList,
            homeController: _homeController,
          ),
          const Spacer(),
          _LogoutSection(),
        ],
      ),
    );
  }

  Widget _buildCloseButton() {
    return Positioned(
      left: -25,
      top: 50,
      child: GestureDetector(
        onTap: () => Get.back(),
        child: Image.asset(
          PngAssets.drawerCurvedRightShape,
          height: 174,
          width: 39,
        ),
      ),
    );
  }
}

class _UserInfoSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Row(
        children: [
          Image.asset(PngAssets.avatarOne, width: 60, height: 60),
          const SizedBox(width: 14),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Muahamma Salah",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "@salahuser@.com",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color: AppColors.grey2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _NavigationItemsSection extends StatelessWidget {
  final List<Map<String, dynamic>> navigationList;
  final HomeController homeController;

  const _NavigationItemsSection({
    required this.navigationList,
    required this.homeController,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.only(left: 32, right: 18),
        itemBuilder: (context, index) {
          return Obx(() {
            final isSelected = homeController.selectedEndDrawerIndex == index;
            return _NavigationItem(
              name: navigationList[index]["name"] as String,
              icon: navigationList[index]["icon"] as String,
              isSelected: isSelected,
              onTap: () {
                Get.back();
                homeController.setSelectedEndDrawerIndex(index);
              },
            );
          });
        },
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: navigationList.length,
      ),
    );
  }
}

class _NavigationItem extends StatelessWidget {
  final String name;
  final String icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavigationItem({
    required this.name,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final iconColor = isSelected ? AppColors.primary : AppColors.grey2;
    final textColor = isSelected ? AppColors.textPrimary : AppColors.grey2;
    final bgColor = isSelected ? AppColors.background : Colors.transparent;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(9),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(9),
        ),
        child: Row(
          children: [
            Image.asset(icon, color: iconColor, width: 20, fit: BoxFit.contain),
            const SizedBox(width: 16),
            Text(
              name,
              style: TextStyle(
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                fontSize: 14,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LogoutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 32, right: 18, bottom: 32),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.error.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(9),
      ),
      child: Row(
        children: [
          Image.asset(
            PngAssets.endDrawerLogOutIcon,
            color: AppColors.error,
            width: 20,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 16),
          Text(
            "Logout",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: AppColors.error,
            ),
          ),
        ],
      ),
    );
  }
}
