import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumio/src/app/contants/assets_path/png_assets.dart';
import 'package:yumio/src/app/styles/app_styles.dart';
import 'package:yumio/src/common/controller/navigation_controller.dart';
import 'package:yumio/src/common/widgets/button/common_elevated_button.dart';
import 'package:yumio/src/common/widgets/common_label_and_dynamic_field.dart';
import 'package:yumio/src/common/widgets/text_field/common_text_input_field.dart';
import 'package:yumio/src/presentation/screens/change_password/controller/change_password_controller.dart';
import 'package:yumio/src/presentation/widgets/common_top_bar.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  late ChangePasswordController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(ChangePasswordController());
  }

  @override
  void dispose() {
    if (Get.isRegistered<ChangePasswordController>()) {
      Get.delete<ChangePasswordController>();
    }
    super.dispose();
  }

  void _handleBackNavigation() {
    if (Get.isRegistered<ChangePasswordController>()) {
      Get.delete<ChangePasswordController>();
    }
    Get.find<NavigationController>().popPage();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        _handleBackNavigation();
      },
      child: Container(
        decoration: BoxDecoration(gradient: AppStyles.linearGradient()),
        child: Column(
          children: [
            const SizedBox(height: 16),
            CommonTopBar(
              title: "Change Password",
              onPressed: _handleBackNavigation,
              isShowRightSideIcon: false,
            ),
            const SizedBox(height: 20),
            _buildCurrentPassword(),
            const SizedBox(height: 16),
            _buildNewPassword(),
            const SizedBox(height: 16),
            _buildConfirmPassword(),
            const SizedBox(height: 42),
            _buildSaveChanges(),
          ],
        ),
      ),
    );
  }

  Widget _buildSaveChanges() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: CommonElevatedButton(buttonName: "Save Changes", onPressed: () {}),
    );
  }

  Widget _buildConfirmPassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: CommonLabelAndDynamicField(
        labelText: "Confirm Password",
        dynamicField: Obx(
          () => CommonTextInputField(
            controller: controller.confirmPasswordController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: controller.confirmPasswordVisible.value,
            showSuffixIcon: true,
            suffixIcon: IconButton(
              onPressed: () {
                controller.confirmPasswordVisible.value =
                    !controller.confirmPasswordVisible.value;
              },
              icon: Image.asset(
                controller.confirmPasswordVisible.value
                    ? PngAssets.commonShowEyeIcon
                    : PngAssets.commonHideEyeIcon,
                width: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNewPassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: CommonLabelAndDynamicField(
        labelText: "New Password",
        dynamicField: Obx(
          () => CommonTextInputField(
            controller: controller.newPasswordController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: controller.newPasswordVisible.value,
            showSuffixIcon: true,
            suffixIcon: IconButton(
              onPressed: () {
                controller.newPasswordVisible.value =
                    !controller.newPasswordVisible.value;
              },
              icon: Image.asset(
                controller.newPasswordVisible.value
                    ? PngAssets.commonShowEyeIcon
                    : PngAssets.commonHideEyeIcon,
                width: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCurrentPassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: CommonLabelAndDynamicField(
        labelText: "Current Password",
        dynamicField: Obx(
          () => CommonTextInputField(
            controller: controller.currentPasswordController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: controller.currentPasswordVisible.value,
            showSuffixIcon: true,
            suffixIcon: IconButton(
              onPressed: () {
                controller.currentPasswordVisible.value =
                    !controller.currentPasswordVisible.value;
              },
              icon: Image.asset(
                controller.currentPasswordVisible.value
                    ? PngAssets.commonShowEyeIcon
                    : PngAssets.commonHideEyeIcon,
                width: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
