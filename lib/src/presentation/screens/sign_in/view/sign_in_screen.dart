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
import 'package:yumio/src/presentation/screens/sign_in/controller/sign_in_controller.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final controller = Get.find<SignInController>();

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
                buildWelcomeBackSection(),
                SizedBox(height: 10),
                buildTitleSection(),
                SizedBox(height: 50),
                buildEmailTextFieldSection(),
                SizedBox(height: 16),
                buildPasswordTextInputFieldSection(),
                SizedBox(height: 5),
                buildRememberMeSection(),
                SizedBox(height: 40),
                buildSignInButtonSection(),
                SizedBox(height: 16),
                buildOrSection(),
                SizedBox(height: 16),
                buildContinueWithGoogleSection(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                buildDoNotHaveAnAccountSection(),
                SizedBox(height: 32),
              ],
            ),
          ),
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
                      Get.toNamed(BaseRoute.signUp);
                    },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContinueWithGoogleSection() {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.border),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(PngAssets.commonGoogleIcon, width: 18),
              SizedBox(width: 10),
              Text(
                "Continue with Google",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildOrSection() {
    return Row(
      children: [
        Expanded(child: Divider(color: AppColors.border)),
        SizedBox(width: 16),
        Text(
          "Or",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 13,
            color: AppColors.grey,
          ),
        ),
        SizedBox(width: 16),
        Expanded(child: Divider(color: AppColors.border)),
      ],
    );
  }

  Widget buildSignInButtonSection() => CommonElevatedButton(
    buttonName: "Sign In",
    onPressed: () {
      if (controller.emailController.text.isEmpty ||
          controller.passwordController.text.isEmpty) {
        showAppToast(
          context: context,
          message: "Fill up all required fields!",
          type: ToastType.error,
          margin: 0.2,
        );
      } else {
        Get.toNamed(BaseRoute.navigation);
        showAppToast(
          context: context,
          message: "Sign In Successfully!",
          type: ToastType.success,
          margin: 0.24,
        );
      }
    },
  );

  Widget buildRememberMeSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            controller.isRememberChecked.value =
                !controller.isRememberChecked.value;
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
                      value: controller.isRememberChecked.value,
                      onChanged: (bool? value) {
                        controller.isRememberChecked.value =
                            !controller.isRememberChecked.value;
                      },
                    ),
                  ),
                ),
                Text(
                  "Remember me",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () => Get.toNamed(BaseRoute.forgotPassword),
          child: Text(
            "Forgot Password?",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 13,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
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

  Widget buildTitleSection() {
    return Text(
      "A login app is a secure and user-friendly  application designed to authenticate",
      style: TextStyle(
        fontWeight: FontWeight.w400,
        color: AppColors.textTertiary,
      ),
    );
  }

  Widget buildWelcomeBackSection() {
    return Text.rich(
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 30,
        color: AppColors.primary,
      ),
      TextSpan(
        children: [
          TextSpan(
            text: "Welcome\n",
            style: TextStyle().copyWith(color: AppColors.primary),
          ),
          TextSpan(
            text: "Back",
            style: TextStyle().copyWith(color: AppColors.textPrimary),
          ),
        ],
      ),
    );
  }
}
