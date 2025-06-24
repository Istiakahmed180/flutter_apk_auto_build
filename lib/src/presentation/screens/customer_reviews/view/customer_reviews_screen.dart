import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumio/src/app/contants/app_colors.dart';
import 'package:yumio/src/app/routes/routes.dart';
import 'package:yumio/src/app/styles/app_styles.dart';
import 'package:yumio/src/common/controller/navigation_controller.dart';
import 'package:yumio/src/presentation/screens/customer_reviews/view/sub_sections/customer_comments_list_section.dart';
import 'package:yumio/src/presentation/screens/customer_reviews/view/sub_sections/customer_reviews_section.dart';
import 'package:yumio/src/presentation/screens/customer_reviews/view/sub_sections/leave_comment_section.dart';
import 'package:yumio/src/presentation/screens/customer_reviews/view/sub_sections/rating_section.dart';
import 'package:yumio/src/presentation/widgets/common_top_bar.dart';

class CustomerReviewsScreen extends StatefulWidget {
  const CustomerReviewsScreen({super.key});

  @override
  State<CustomerReviewsScreen> createState() => _CustomerReviewsScreenState();
}

class _CustomerReviewsScreenState extends State<CustomerReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        Get.find<NavigationController>().popPage();
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(gradient: AppStyles.linearGradient()),
          child: Column(
            children: [
              const SizedBox(height: 16),
              _buildCommonTopBar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      CustomerReviewsSection(),
                      const SizedBox(height: 20),
                      _buildTitle(),
                      const SizedBox(height: 20),
                      CustomerCommentsListSection(),
                      const SizedBox(height: 18),
                      RatingSection(),
                      const SizedBox(height: 18),
                      LeaveCommentSection(),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Text(
        "4 Review for Creamy Garlic\nChicken",
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 20,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }
}

Widget _buildCommonTopBar() {
  return CommonTopBar(
    title: "Customer Reviews",
    onPressed: () {
      Get.find<NavigationController>().popPage();
    },
    rightSideOnPressed: () {
      Get.find<NavigationController>().pushNamed(BaseRoute.notification);
    },
  );
}
