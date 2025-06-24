import 'package:get/get.dart';
import 'package:yumio/src/common/controller/navigation_controller.dart';
import 'package:yumio/src/presentation/screens/forgot_password/controller/forgot_password_controller.dart';
import 'package:yumio/src/presentation/screens/home/controller/home_controller.dart';
import 'package:yumio/src/presentation/screens/sign_in/controller/sign_in_controller.dart';
import 'package:yumio/src/presentation/screens/sign_up/controller/sign_up_controller.dart';
import 'package:yumio/src/presentation/screens/verify_code/controller/verify_code_controller.dart';

// Sign In Binding
class SignInBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(() => SignInController());
  }
}

// Sign Up Binding
class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(() => SignUpController());
  }
}

// Forgot Password Binding
class ForgotPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController());
  }
}

// Verify Code Binding
class VerifyCodeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifyCodeController>(() => VerifyCodeController());
  }
}

// Navigation Binding
class NavigationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationController>(() => NavigationController());
  }
}

// Home Binding
class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
