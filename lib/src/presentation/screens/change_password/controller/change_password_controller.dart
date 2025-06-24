import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  final RxBool currentPasswordVisible = true.obs;
  final RxBool newPasswordVisible = true.obs;
  final RxBool confirmPasswordVisible = true.obs;

  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
}
