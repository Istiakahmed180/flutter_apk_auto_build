import 'package:get/get.dart';
import 'package:yumio/src/app/bindings/app_bindings.dart';
import 'package:yumio/src/app/routes/routes.dart';
import 'package:yumio/src/app/routes/routes_config.dart';

List<GetPage> routesHandler = [
  // Splash Screen Handler
  GetPage(name: BaseRoute.splash, page: () => RoutesConfig.splash),

  // Onboarding Screen Handler
  GetPage(name: BaseRoute.onboarding, page: () => RoutesConfig.onboarding),

  // Sign In Screen Handler
  GetPage(
    name: BaseRoute.signIn,
    page: () => RoutesConfig.signIn,
    binding: SignInBinding(),
  ),

  // Sign Up Screen Handler
  GetPage(
    name: BaseRoute.signUp,
    page: () => RoutesConfig.signUp,
    binding: SignUpBinding(),
  ),

  // Forgot Password Screen Handler
  GetPage(
    name: BaseRoute.forgotPassword,
    page: () => RoutesConfig.forgotPassword,
    binding: ForgotPasswordBinding(),
  ),

  // Verify Code Screen Handler
  GetPage(
    name: BaseRoute.verifyCode,
    page: () => RoutesConfig.verifyCode,
    binding: VerifyCodeBinding(),
  ),

  // Navigation Screen Handler
  GetPage(
    name: BaseRoute.navigation,
    page: () => RoutesConfig.navigation,
    bindings: [NavigationBinding(), HomeBinding()],
  ),

  // Subscription Plan Screen Handler
  GetPage(
    name: BaseRoute.subscriptionPlan,
    page: () => RoutesConfig.subscriptionPlan,
  ),

  // Notification Screen Handler
  GetPage(name: BaseRoute.notification, page: () => RoutesConfig.notification),

  // Home Screen Handler
  GetPage(name: BaseRoute.home, page: () => RoutesConfig.home),

  // Favorites Screen Handler
  GetPage(name: BaseRoute.favorite, page: () => RoutesConfig.favorite),

  // Subscription Screen Handler
  GetPage(name: BaseRoute.subscription, page: () => RoutesConfig.subscription),

  // Settings Screen Handler
  GetPage(name: BaseRoute.settings, page: () => RoutesConfig.settings),

  // Recipes Screen Handler
  GetPage(name: BaseRoute.recipes, page: () => RoutesConfig.recipes),

  // Recipe Details Screen Handler
  GetPage(
    name: BaseRoute.recipesDetails,
    page: () => RoutesConfig.recipesDetails,
  ),

  // Customer Reviews Screen Handler
  GetPage(
    name: BaseRoute.customerReviews,
    page: () => RoutesConfig.customerReviews,
  ),

  // Edit Profile Screen Handler
  GetPage(name: BaseRoute.editProfile, page: () => RoutesConfig.editProfile),

  // Change Password Screen Handler
  GetPage(
    name: BaseRoute.changePassword,
    page: () => RoutesConfig.changePassword,
  ),

  // Privacy Policy Screen Handler
  GetPage(
    name: BaseRoute.privacyPolicy,
    page: () => RoutesConfig.privacyPolicy,
  ),

  // Help & Support Screen Handler
  GetPage(
    name: BaseRoute.helpAndSupport,
    page: () => RoutesConfig.helpAndSupport,
  ),
];
