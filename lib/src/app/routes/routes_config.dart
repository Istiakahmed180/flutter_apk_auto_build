import 'package:yumio/src/app/navigation/navigation_screen.dart';
import 'package:yumio/src/presentation/screens/change_password/view/change_password_screen.dart';
import 'package:yumio/src/presentation/screens/customer_reviews/view/customer_reviews_screen.dart';
import 'package:yumio/src/presentation/screens/edit_profile/view/edit_profile_screen.dart';
import 'package:yumio/src/presentation/screens/favorite/view/favorite_screen.dart';
import 'package:yumio/src/presentation/screens/forgot_password/view/forgot_password_screen.dart';
import 'package:yumio/src/presentation/screens/help_and_support/view/help_and_support_screen.dart';
import 'package:yumio/src/presentation/screens/home/view/home_screen.dart';
import 'package:yumio/src/presentation/screens/notification/view/notification_screen.dart';
import 'package:yumio/src/presentation/screens/onboarding/view/onboarding_screen.dart';
import 'package:yumio/src/presentation/screens/privacy_policy/view/privacy_policy_screen.dart';
import 'package:yumio/src/presentation/screens/recipe_details/view/recipe_details_screen.dart';
import 'package:yumio/src/presentation/screens/recipes/view/recipes_screen.dart';
import 'package:yumio/src/presentation/screens/setting/view/setting_screen.dart';
import 'package:yumio/src/presentation/screens/sign_in/view/sign_in_screen.dart';
import 'package:yumio/src/presentation/screens/sign_up/view/sign_up_screen.dart';
import 'package:yumio/src/presentation/screens/splash/view/splash_screen.dart';
import 'package:yumio/src/presentation/screens/subscription/view/subscription_plan/subscription_plan.dart';
import 'package:yumio/src/presentation/screens/subscription/view/subscription_screen.dart';
import 'package:yumio/src/presentation/screens/verify_code/view/verify_code_screen.dart';

class RoutesConfig {
  // Splash Screen
  static const splash = SplashScreen();

  // Onboarding Screen
  static const onboarding = OnboardingScreen();

  // Sign In Screen
  static const signIn = SignInScreen();

  // Sign Up Screen
  static const signUp = SignUpScreen();

  // Forgot Password Screen
  static const forgotPassword = ForgotPasswordScreen();

  // Verify Code Screen
  static const verifyCode = VerifyCodeScreen();

  // Navigation Screen
  static const navigation = NavigationScreen();

  // Subscription Plan Screen
  static const subscriptionPlan = SubscriptionPlan();

  // Notification Screen
  static const notification = NotificationScreen();

  // Home Screen
  static const home = HomeScreen();

  // Favorite Screen
  static const favorite = FavoriteScreen();

  // Subscription Screen
  static const subscription = SubscriptionScreen();

  // Settings Screen
  static const settings = SettingScreen();

  // Recipes Screen
  static const recipes = RecipesScreen();

  // Recipe Details Screen
  static const recipesDetails = RecipeDetailsScreen();

  // Customer Reviews Screen
  static const customerReviews = CustomerReviewsScreen();

  // Edit Profile Screen
  static const editProfile = EditProfileScreen();

  // Change Password Screen
  static const changePassword = ChangePasswordScreen();

  // Privacy Policy Screen
  static const privacyPolicy = PrivacyPolicyScreen();

  // Help & Support Screen
  static const helpAndSupport = HelpAndSupportScreen();
}
