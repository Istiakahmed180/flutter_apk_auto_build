import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumio/src/app/contants/app_colors.dart';
import 'package:yumio/src/app/contants/assets_path/png_assets.dart';
import 'package:yumio/src/app/routes/routes.dart';
import 'package:yumio/src/common/controller/navigation_controller.dart';
import 'package:yumio/src/common/widgets/button/common_elevated_button.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        Get.find<NavigationController>().selectedIndex.value = 0;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primary.withValues(alpha: 0.30),
                  AppColors.primary.withValues(alpha: 0),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 36),
                buildDiamondSection(),
                SizedBox(height: 60),
                buildTitleSection(),
                SizedBox(height: 10),
                buildSubTitleSection(),
                SizedBox(height: 30),
                buildFeaturesSection(),
                SizedBox(height: 66),
                buildSubscriptionNowButtonSection(),
                SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSubscriptionNowButtonSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: CommonElevatedButton(
        buttonName: "Subscription Now",
        onPressed: () {
          Get.find<NavigationController>().pushNamed(
            BaseRoute.subscriptionPlan,
          );
        },
      ),
    );
  }

  Widget buildFeaturesSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          buildFeatureTextSection(title: "Save unlimited recipes"),
          SizedBox(height: 16),
          buildFeatureTextSection(title: "Access exclusive premium content"),
          SizedBox(height: 16),
          buildFeatureTextSection(title: "Ad-free experience"),
          SizedBox(height: 16),
          buildFeatureTextSection(title: "Weekly meal plan generator"),
          SizedBox(height: 16),
          buildFeatureTextSection(title: "Early access to new features"),
        ],
      ),
    );
  }

  Widget buildFeatureTextSection({required String title}) {
    return Row(
      children: [
        SizedBox(width: 10),
        CircleAvatar(radius: 2.5, backgroundColor: AppColors.textTertiary),
        SizedBox(width: 10),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: AppColors.textTertiary,
          ),
        ),
      ],
    );
  }

  Widget buildSubTitleSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: "And get up to ",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: AppColors.textTertiary,
              ),
            ),
            TextSpan(
              text: "5 days ",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: AppColors.primary,
              ),
            ),
            TextSpan(
              text: "free",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: AppColors.textTertiary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTitleSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Text(
        "Go Premium & Unlock\nFull Access",
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 30,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }

  Widget buildDiamondSection() =>
      Center(child: Image.asset(PngAssets.diamond, width: 260, height: 230));
}
