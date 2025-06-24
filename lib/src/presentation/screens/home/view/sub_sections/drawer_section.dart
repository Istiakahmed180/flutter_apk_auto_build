import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumio/src/app/contants/app_colors.dart';
import 'package:yumio/src/app/contants/assets_path/png_assets.dart';
import 'package:yumio/src/app/routes/routes.dart';
import 'package:yumio/src/common/controller/navigation_controller.dart';
import 'package:yumio/src/presentation/screens/home/controller/home_controller.dart';

class DrawerSection extends StatelessWidget {
  DrawerSection({super.key});

  final HomeController homeController = Get.find();
  final List<Map<String, dynamic>> navigationList = [
    {
      "name": "Home",
      "icon": PngAssets.drawerHomeIcon,
      "index": "0",
      "navigate": BaseRoute.home,
    },
    {
      "name": "All Recipes",
      "icon": PngAssets.drawerRecipeIcon,
      "index": "0",
      "navigate": BaseRoute.recipes,
    },
    {
      "name": "Favorites",
      "icon": PngAssets.drawerFavoriteIcon,
      "index": "1",
      "navigate": BaseRoute.favorite,
    },
    {
      "name": "Our Subscription",
      "icon": PngAssets.drawerSubscriptionIcon,
      "index": "2",
      "navigate": BaseRoute.subscription,
    },
    {
      "name": "Privacy Policy",
      "icon": PngAssets.drawerPrivacyAndPolicyIcon,
      "index": "3",
      "navigate": BaseRoute.settings,
    },
    {
      "name": "Help Center",
      "icon": PngAssets.drawerHelpCenterIcon,
      "index": "3",
      "navigate": BaseRoute.settings,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Drawer(
            width: MediaQuery.of(context).size.width * 0.85,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            backgroundColor: AppColors.white,
            child: Column(
              children: [
                _buildTopPreviewSection(),
                const SizedBox(height: 30),
                _buildNavigationItemsSection(),
              ],
            ),
          ),
          Positioned(
            right: -25,
            top: 120,
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Image.asset(
                PngAssets.drawerCurvedShape,
                height: 174,
                width: 39,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationItemsSection() {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.only(left: 18, right: 32),
        itemBuilder: (context, index) {
          return Obx(() {
            final isSelected = homeController.selectedDrawerIndex == index;
            return _buildNavigationItem(index, isSelected);
          });
        },
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: navigationList.length,
      ),
    );
  }

  Widget _buildNavigationItem(int index, bool isSelected) {
    final navigation = navigationList[index];
    final name = navigation["name"];
    final icon = navigation["icon"];
    final navigationIndex = navigation["index"];
    final navigate = navigation["navigate"];

    final iconColor = isSelected ? AppColors.primary : AppColors.grey2;
    final textColor = isSelected ? AppColors.textPrimary : AppColors.grey2;
    final bgColor = isSelected ? AppColors.background : AppColors.transparent;

    return InkWell(
      onTap: () {
        Get.back();
        homeController.setSelectedDrawerIndex(index);
        final navigationController = Get.find<NavigationController>();
        navigationController.selectedIndex.value = int.parse(navigationIndex);
        navigationController.pushNamed(navigate);
      },

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

  Widget _buildTopPreviewSection() {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Image.asset(
          PngAssets.drawerPreview,
          width: double.infinity,
          height: 138,
          fit: BoxFit.fitWidth,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18, bottom: 15),
          child: Text(
            "Yumio Cooking Recipes",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 22,
              color: AppColors.white,
            ),
          ),
        ),
      ],
    );
  }
}
