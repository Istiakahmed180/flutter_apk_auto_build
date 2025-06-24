import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:yumio/src/app/contants/app_colors.dart';
import 'package:yumio/src/app/routes/routes.dart';
import 'package:yumio/src/common/widgets/button/common_elevated_button.dart';
import 'package:yumio/src/common/widgets/common_back_button.dart';
import 'package:yumio/src/helper/toast_helper.dart';
import 'package:yumio/src/presentation/screens/verify_code/controller/verify_code_controller.dart';

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({super.key});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final Map<String, String> args = Get.arguments;
  final controller = Get.find<VerifyCodeController>();

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
            buildVerifyCodeSection(),
            SizedBox(height: 10),
            buildTitleSection(),
            SizedBox(height: 50),
            buildPinCodeSection(context),
            SizedBox(height: 40),
            buildVerifySection(),
            Spacer(),
            buildDoNotHaveAnAccountSection(),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget buildPinCodeSection(BuildContext context) {
    return PinCodeTextField(
      controller: controller.pinNumberController,
      keyboardType: TextInputType.number,
      cursorColor: AppColors.primary,
      textStyle: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 18,
        color: AppColors.textPrimary,
      ),
      pinTheme: PinTheme(
        borderWidth: 1,
        activeBorderWidth: 1,
        disabledBorderWidth: 1,
        inactiveBorderWidth: 1,
        shape: PinCodeFieldShape.box,
        fieldHeight: 60,
        fieldWidth: 58,
        activeColor: AppColors.inputBorder,
        activeFillColor: AppColors.transparent,
        inactiveColor: Color(0xFF222222).withValues(alpha: 0.10),
        inactiveFillColor: AppColors.transparent,
        selectedColor: AppColors.primary,
        selectedFillColor: AppColors.transparent,
        selectedBorderWidth: 1,
        borderRadius: BorderRadius.circular(12),
      ),
      appContext: context,
      length: 4,
    );
  }

  Widget buildVerifySection() => CommonElevatedButton(
    buttonName: "Verify",
    onPressed: () {
      if (controller.pinNumberController.text.isEmpty) {
        showAppToast(
          context: context,
          message: "Pin number is required!",
          type: ToastType.error,
          margin: 0.2,
        );
      }
    },
  );

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

  Widget buildTitleSection() {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "Your code was sent to ",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: AppColors.textTertiary,
            ),
          ),
          TextSpan(
            text: args["email"],
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.textTertiary,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildVerifyCodeSection() {
    return Text.rich(
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 30,
        color: AppColors.primary,
      ),
      TextSpan(
        children: [
          TextSpan(
            text: "Verify ",
            style: TextStyle().copyWith(color: AppColors.primary),
          ),
          TextSpan(
            text: "Code",
            style: TextStyle().copyWith(color: AppColors.textPrimary),
          ),
        ],
      ),
    );
  }
}
