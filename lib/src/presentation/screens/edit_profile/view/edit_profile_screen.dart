import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumio/src/app/contants/app_colors.dart';
import 'package:yumio/src/app/contants/assets_path/png_assets.dart';
import 'package:yumio/src/app/styles/app_styles.dart';
import 'package:yumio/src/common/controller/navigation_controller.dart';
import 'package:yumio/src/common/widgets/button/common_elevated_button.dart';
import 'package:yumio/src/common/widgets/common_label_and_dynamic_field.dart';
import 'package:yumio/src/common/widgets/text_field/common_text_input_field.dart';
import 'package:yumio/src/presentation/widgets/common_top_bar.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        Get.find<NavigationController>().popPage();
      },
      child: Container(
        decoration: BoxDecoration(gradient: AppStyles.linearGradient()),
        child: Column(
          children: [
            const SizedBox(height: 16),
            _buildCommonTopBar(),
            const SizedBox(height: 18),
            _buildProfilePictureUpload(),
            const SizedBox(height: 16),
            _buildFirstName(),
            const SizedBox(height: 16),
            _buildLastName(),
            const SizedBox(height: 16),
            _buildEmailAddress(),
            const SizedBox(height: 42),
            _buildSaveChanges(),
          ],
        ),
      ),
    );
  }

  Widget _buildSaveChanges() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: CommonElevatedButton(buttonName: "Save Changes", onPressed: () {}),
    );
  }

  Widget _buildEmailAddress() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: CommonLabelAndDynamicField(
        labelText: "Email Address",
        dynamicField: CommonTextInputField(
          controller: TextEditingController(text: "cookingrecipe@gmail.com"),
        ),
      ),
    );
  }

  Widget _buildLastName() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: CommonLabelAndDynamicField(
        labelText: "Last Name",
        dynamicField: CommonTextInputField(
          controller: TextEditingController(text: "Salah"),
        ),
      ),
    );
  }

  Widget _buildFirstName() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: CommonLabelAndDynamicField(
        labelText: "First Name",
        dynamicField: CommonTextInputField(
          controller: TextEditingController(text: "Muhammad"),
        ),
      ),
    );
  }

  Widget _buildProfilePictureUpload() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: CommonLabelAndDynamicField(
        labelText: "Profile Picture",
        dynamicField: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(PngAssets.profilePictureFrame),
            Column(
              children: [
                Image.asset(
                  PngAssets.commonImageUploadIcon,
                  width: 18,
                  height: 18,
                ),
                const SizedBox(height: 10),
                Text(
                  "Upload Image",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: AppColors.grey2,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCommonTopBar() {
    return CommonTopBar(
      title: "Edit Profile",
      onPressed: () {
        Get.find<NavigationController>().popPage();
      },
      isShowRightSideIcon: false,
    );
  }
}
