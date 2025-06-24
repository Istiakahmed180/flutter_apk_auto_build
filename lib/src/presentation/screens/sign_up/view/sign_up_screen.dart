import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumio/src/app/contants/app_colors.dart';
import 'package:yumio/src/app/contants/assets_path/png_assets.dart';
import 'package:yumio/src/app/routes/routes.dart';
import 'package:yumio/src/common/widgets/button/common_elevated_button.dart';
import 'package:yumio/src/common/widgets/common_label_and_dynamic_field.dart';
import 'package:yumio/src/common/widgets/text_field/common_text_input_field.dart';
import 'package:yumio/src/helper/toast_helper.dart';
import 'package:yumio/src/presentation/screens/sign_up/controller/sign_up_controller.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final controller = Get.find<SignUpController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                buildCreateAnAccountSection(),
                SizedBox(height: 10),
                buildTitleSection(),
                SizedBox(height: 50),
                buildNameTextFieldSection(),
                SizedBox(height: 16),
                buildEmailTextFieldSection(),
                SizedBox(height: 16),
                buildPasswordTextInputFieldSection(),
                SizedBox(height: 16),
                buildConfirmPasswordTextInputFieldSection(),
                SizedBox(height: 5),
                buildTermsAndConditionSection(),
                SizedBox(height: 40),
                buildSignUpButtonSection(),
                SizedBox(height: 40),
                buildAlreadyHaveAnAccountSection(),
                SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAlreadyHaveAnAccountSection() {
    return Center(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: "Already have an account? ",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: AppColors.grey2,
              ),
            ),
            TextSpan(
              text: "Sign In",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 13,
                color: AppColors.primary,
              ),
              recognizer:
                  TapGestureRecognizer()
                    ..onTap = () {
                      Get.offNamed(BaseRoute.signIn);
                    },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSignUpButtonSection() => CommonElevatedButton(
    buttonName: "Sign Up",
    onPressed: () {
      if (controller.nameController.text.isEmpty ||
          controller.emailController.text.isEmpty ||
          controller.passwordController.text.isEmpty ||
          controller.confirmPasswordController.text.isEmpty) {
        showAppToast(
          context: context,
          message: "Fill up all required fields!",
          type: ToastType.error,
          margin: 0.2,
        );
      } else if (controller.passwordController.text !=
          controller.confirmPasswordController.text) {
        showAppToast(
          context: context,
          message: "Password not match!",
          type: ToastType.error,
          margin: 0.22,
        );
      } else {
        Get.toNamed(BaseRoute.navigation);
        showAppToast(
          context: context,
          message: "Sign Up Successfully!",
          type: ToastType.success,
          margin: 0.22,
        );
      }
    },
  );

  Widget buildTermsAndConditionSection() {
    return GestureDetector(
      onTap: () {
        controller.isTermsAndConditionChecked.value =
            !controller.isTermsAndConditionChecked.value;
      },
      child: Transform.translate(
        offset: Offset(-06, 0),
        child: Row(
          children: [
            Obx(
              () => Transform.scale(
                scale: 0.95,
                child: Checkbox(
                  side: BorderSide(color: AppColors.grey),
                  splashRadius: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  checkColor: AppColors.white,
                  activeColor: AppColors.primary,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: VisualDensity.compact,
                  value: controller.isTermsAndConditionChecked.value,
                  onChanged: (bool? value) {
                    controller.isTermsAndConditionChecked.value =
                        !controller.isTermsAndConditionChecked.value;
                  },
                ),
              ),
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "I agree with the? ",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  TextSpan(
                    text: "Terms & Condition",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildConfirmPasswordTextInputFieldSection() {
    return CommonLabelAndDynamicField(
      labelText: "Confirm Password",
      dynamicField: Obx(
        () => CommonTextInputField(
          controller: controller.confirmPasswordController,
          keyboardType: TextInputType.visiblePassword,
          obscureText: controller.isConfirmPasswordVisible.value,
          showSuffixIcon: true,
          suffixIcon: IconButton(
            onPressed: () {
              controller.isConfirmPasswordVisible.value =
                  !controller.isConfirmPasswordVisible.value;
            },
            icon: Image.asset(
              controller.isConfirmPasswordVisible.value
                  ? PngAssets.commonShowEyeIcon
                  : PngAssets.commonHideEyeIcon,
              width: 18,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPasswordTextInputFieldSection() {
    return CommonLabelAndDynamicField(
      labelText: "Password",
      dynamicField: Obx(
        () => CommonTextInputField(
          controller: controller.passwordController,
          keyboardType: TextInputType.visiblePassword,
          obscureText: controller.isPasswordVisible.value,
          showSuffixIcon: true,
          suffixIcon: IconButton(
            onPressed: () {
              controller.isPasswordVisible.value =
                  !controller.isPasswordVisible.value;
            },
            icon: Image.asset(
              controller.isPasswordVisible.value
                  ? PngAssets.commonShowEyeIcon
                  : PngAssets.commonHideEyeIcon,
              width: 18,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildEmailTextFieldSection() {
    return CommonLabelAndDynamicField(
      labelText: "Email",
      dynamicField: CommonTextInputField(
        hintText: "cookingrecipe@gmail.com",
        keyboardType: TextInputType.emailAddress,
        controller: controller.emailController,
      ),
    );
  }

  Widget buildNameTextFieldSection() {
    return CommonLabelAndDynamicField(
      labelText: "Your Name",
      dynamicField: CommonTextInputField(
        keyboardType: TextInputType.name,
        controller: controller.nameController,
      ),
    );
  }

  Widget buildTitleSection() {
    return Text(
      "A login app is a secure and user-friendly  application designed to authenticate",
      style: TextStyle(
        fontWeight: FontWeight.w400,
        color: AppColors.textTertiary,
      ),
    );
  }

  Widget buildCreateAnAccountSection() {
    return Text.rich(
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 30,
        color: AppColors.primary,
      ),
      TextSpan(
        children: [
          TextSpan(
            text: "Create An\n",
            style: TextStyle().copyWith(color: AppColors.primary),
          ),
          TextSpan(
            text: "Account",
            style: TextStyle().copyWith(color: AppColors.textPrimary),
          ),
        ],
      ),
    );
  }
}
