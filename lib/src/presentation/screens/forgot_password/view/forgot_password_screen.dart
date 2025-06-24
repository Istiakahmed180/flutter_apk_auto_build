import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumio/src/app/contants/app_colors.dart';
import 'package:yumio/src/app/routes/routes.dart';
import 'package:yumio/src/common/widgets/button/common_elevated_button.dart';
import 'package:yumio/src/common/widgets/common_back_button.dart';
import 'package:yumio/src/common/widgets/common_label_and_dynamic_field.dart';
import 'package:yumio/src/common/widgets/text_field/common_text_input_field.dart';
import 'package:yumio/src/helper/toast_helper.dart';
import 'package:yumio/src/presentation/screens/forgot_password/controller/forgot_password_controller.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final controller = Get.find<ForgotPasswordController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            CommonBackButton(onTap: () => Get.back()),
            Spacer(),
            buildForgotPasswordSection(),
            SizedBox(height: 10),
            buildTitleSection(),
            SizedBox(height: 50),
            buildEmailTextFieldSection(),
            SizedBox(height: 40),
            buildResetPasswordSection(),
            Spacer(),
            buildDoNotHaveAnAccountSection(),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget buildDoNotHaveAnAccountSection() {
    return Center(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: "Don't have an account? ",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: AppColors.grey2,
              ),
            ),
            TextSpan(
              text: "Sign Up",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 13,
                color: AppColors.primary,
              ),
              recognizer:
                  TapGestureRecognizer()
                    ..onTap = () {
                      Get.offNamed(BaseRoute.signUp);
                    },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildResetPasswordSection() => CommonElevatedButton(
    buttonName: "Reset Password",
    onPressed: () {
      if (controller.emailController.text.isEmpty) {
        showAppToast(
          context: context,
          message: "Fill up all required fields!",
          type: ToastType.error,
          margin: 0.2,
        );
      } else {
        Get.toNamed(
          BaseRoute.verifyCode,
          arguments: {"email": controller.emailController.text},
        );
      }
    },
  );

  Widget buildEmailTextFieldSection() {
    return CommonLabelAndDynamicField(
      labelText: "Email",
      dynamicField: CommonTextInputField(
        hintText: "Enter your email",
        keyboardType: TextInputType.emailAddress,
        controller: controller.emailController,
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

  Widget buildForgotPasswordSection() {
    return Text.rich(
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 30,
        color: AppColors.primary,
      ),
      TextSpan(
        children: [
          TextSpan(
            text: "Forgot\n",
            style: TextStyle().copyWith(color: AppColors.primary),
          ),
          TextSpan(
            text: "Password",
            style: TextStyle().copyWith(color: AppColors.textPrimary),
          ),
        ],
      ),
    );
  }
}
