import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumio/src/app/contants/app_colors.dart';
import 'package:yumio/src/app/contants/assets_path/png_assets.dart';
import 'package:yumio/src/app/routes/routes.dart';
import 'package:yumio/src/common/controller/navigation_controller.dart';
import 'package:yumio/src/common/widgets/button/common_elevated_button.dart';
import 'package:yumio/src/presentation/widgets/common_top_bar.dart';

class SubscriptionPlan extends StatefulWidget {
  const SubscriptionPlan({super.key});

  @override
  State<SubscriptionPlan> createState() => _SubscriptionPlanState();
}

class _SubscriptionPlanState extends State<SubscriptionPlan> {
  int selectedPlan = 0;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        Get.find<NavigationController>().popPage();
      },
      child: Column(
        children: [
          const SizedBox(height: 16),
          _buildCommonTopBar(),
          const SizedBox(height: 80),
          _buildPlanSelectionSection(),
          const Spacer(),
          _buildSelectPlanButton(),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildCommonTopBar() {
    return CommonTopBar(
      title: "Choose Your Plan",
      onPressed: () => Get.find<NavigationController>().popPage(),
      rightSideOnPressed: () {
        Get.find<NavigationController>().pushNamed(BaseRoute.notification);
      },
    );
  }

  Widget _buildPlanSelectionSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border(
          left: BorderSide(color: AppColors.primary),
          right: BorderSide(color: AppColors.primary),
          bottom: BorderSide(color: AppColors.primary),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPlanTabs(),
          const SizedBox(height: 40),
          _buildPlanDetails(),
        ],
      ),
    );
  }

  Widget _buildPlanTabs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildPlanTab("Basic Plan", 0),
        _buildPlanTab("Pro Plan", 1),
        _buildPlanTab("Family Plan", 2),
      ],
    );
  }

  Widget _buildPlanTab(String planName, int planIndex) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () => setState(() => selectedPlan = planIndex),
      child: Container(
        alignment: Alignment.center,
        width: 100,
        height: 38,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color:
              selectedPlan == planIndex
                  ? AppColors.primary
                  : Colors.transparent,
          border: Border.all(
            color: AppColors.primary,
            width: selectedPlan == planIndex ? 0 : 1,
          ),
        ),
        child: Text(
          planName,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color:
                selectedPlan == planIndex
                    ? Colors.white
                    : AppColors.textPrimary,
          ),
        ),
      ),
    );
  }

  Widget _buildPlanDetails() {
    switch (selectedPlan) {
      case 0:
        return _buildPlanContent(
          price: "\$4",
          features: [
            "Access 500+ recipes",
            "Save up to 20 favorites",
            "Create 1 grocery list",
            "Basic meal recommendations",
          ],
        );
      case 1:
        return _buildPlanContent(
          price: "\$4.99",
          features: [
            "Access 5,000+ exclusive recipes",
            "Unlimited favorites",
            "Smart grocery lists",
            "Weekly meal planner",
            "Ad-free experience",
            "Sync across devices",
          ],
        );
      case 2:
        return _buildPlanContent(
          price: "\$4.99",
          features: [
            "Everything in Pro, plus:",
            "Share with up to 5 family members",
            "Family meal planning tools",
            "Kid-friendly recipe filters",
            "Nutrition breakdown per person",
          ],
        );
      default:
        return const SizedBox();
    }
  }

  Widget _buildPlanContent({
    required String price,
    required List<String> features,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPriceText(price),
          const SizedBox(height: 20),
          ...features.map((feature) => _buildFeatureItem(feature)),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildPriceText(String price) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "$price ",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: AppColors.textPrimary,
            ),
          ),
          TextSpan(
            text: "/ ",
            style: TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: 24,
              color: AppColors.textPrimary,
            ),
          ),
          TextSpan(
            text: "per month",
            style: TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: 24,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Image.asset(PngAssets.commonCheckIcon, width: 18),
          const SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: AppColors.textTertiary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectPlanButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: CommonElevatedButton(buttonName: "Select Plan", onPressed: () {}),
    );
  }
}
