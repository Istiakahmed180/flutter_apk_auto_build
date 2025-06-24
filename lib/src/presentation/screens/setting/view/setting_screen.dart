import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumio/src/app/contants/app_colors.dart';
import 'package:yumio/src/app/contants/assets_path/png_assets.dart';
import 'package:yumio/src/app/routes/routes.dart';
import 'package:yumio/src/common/controller/navigation_controller.dart';
import 'package:yumio/src/presentation/screens/setting/controller/settings_controller.dart';
import 'package:yumio/src/presentation/screens/setting/view/sub_sections/delete_account_pop_up.dart';
import 'package:yumio/src/presentation/widgets/common_top_bar.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final SettingsController controller = Get.put(SettingsController());

  final List<Map<String, dynamic>> navigationList = [
    {
      "icon": PngAssets.settingsEditProfileIcon,
      "title": "Edit Profile",
      "navigation": BaseRoute.editProfile,
    },
    {
      "icon": PngAssets.settingsChangePasswordIcon,
      "title": "Change Password",
      "navigation": BaseRoute.changePassword,
    },
    {
      "icon": PngAssets.settingsNotificationIcon,
      "title": "All Notification",
      "navigation": BaseRoute.notification,
    },
    {"icon": PngAssets.settingsDeleteAccountIcon, "title": "Delete Account"},
    {
      "icon": PngAssets.settingsPrivacyPolicyIcon,
      "title": "Privacy Policy",
      "navigation": BaseRoute.privacyPolicy,
    },
    {
      "icon": PngAssets.settingsHelpAndSupportIcon,
      "title": "Help & Support",
      "navigation": BaseRoute.helpAndSupport,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        Get.find<NavigationController>().selectedIndex.value = 0;
      },
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 16),
            _buildCommonTopBar(),
            const SizedBox(height: 16),
            _buildSettingsNavigation(),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsNavigation() {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final navigation = navigationList[index];

        return InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {
            controller.changeIndex(index);
            if (navigation["navigation"] != null) {
              Get.find<NavigationController>().pushNamed(
                navigation["navigation"],
              );
            } else {
              if (navigation["title"] == "Delete Account") {
                Get.dialog(
                  // barrierDismissible: false,
                  DeleteAccountPopUp(),
                );
              }
            }
          },
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            child: Obx(() {
              final isSelected = controller.selectedIndex.value == index;

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        navigation["icon"],
                        width: 20,
                        height: 20,
                        color:
                            isSelected
                                ? AppColors.primary
                                : AppColors.textPrimary,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        navigation["title"],
                        style: TextStyle(
                          fontWeight:
                              isSelected ? FontWeight.w600 : FontWeight.w500,
                          fontSize: 12,
                          color:
                              isSelected
                                  ? AppColors.textTertiary
                                  : AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    PngAssets.commonRightArrowIcon,
                    width: 18,
                    height: 18,
                    color: isSelected ? AppColors.textPrimary : AppColors.grey2,
                  ),
                ],
              );
            }),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 4),
      itemCount: navigationList.length,
    );
  }

  Widget _buildCommonTopBar() {
    return CommonTopBar(
      title: "Settings",
      onPressed: () {
        Get.find<NavigationController>().selectedIndex.value = 0;
      },
      isShowRightSideIcon: false,
    );
  }
}
