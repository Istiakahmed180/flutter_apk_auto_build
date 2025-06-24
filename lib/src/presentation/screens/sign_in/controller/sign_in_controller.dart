import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  final RxBool isPasswordVisible = true.obs;
  final RxBool isRememberChecked = false.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }
}
