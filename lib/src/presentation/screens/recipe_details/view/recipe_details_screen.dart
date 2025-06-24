import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumio/src/app/contants/app_colors.dart';
import 'package:yumio/src/app/contants/assets_path/png_assets.dart';
import 'package:yumio/src/app/routes/routes.dart';
import 'package:yumio/src/app/styles/app_styles.dart';
import 'package:yumio/src/common/controller/navigation_controller.dart';
import 'package:yumio/src/common/widgets/button/common_elevated_button.dart';
import 'package:yumio/src/presentation/screens/recipe_details/controller/recipe_details_controller.dart';
import 'package:yumio/src/presentation/screens/recipe_details/view/sub_sections/comment_section.dart';
import 'package:yumio/src/presentation/screens/recipe_details/view/sub_sections/image_slider_section.dart';
import 'package:yumio/src/presentation/screens/recipe_details/view/sub_sections/ingredients_section.dart';
import 'package:yumio/src/presentation/screens/recipe_details/view/sub_sections/instructions_section.dart';
import 'package:yumio/src/presentation/screens/recipe_details/view/sub_sections/video_section.dart';

class RecipeDetailsScreen extends StatefulWidget {
  const RecipeDetailsScreen({super.key});

  @override
  State<RecipeDetailsScreen> createState() => _RecipeDetailsScreenState();
}

class _RecipeDetailsScreenState extends State<RecipeDetailsScreen> {
  final RecipeDetailsController controller = Get.put(RecipeDetailsController());

  String description =
      "A creamy, energizing plant-based milk blend with raw cacao and adaptogenic maca, "
      "crafted with organic almonds and coconut milk for rich texture. "
      "Naturally sweetened with dates and enhanced with superfoods like chia seeds "
      "and flaxseed for added omega-3s. This dairy-free elixir provides sustained energy, "
      "supports hormonal balance, and delivers antioxidant benefits. Perfect for post-workout "
      "recovery or as a morning boost, it's vegan, paleo-friendly, and free from refined sugars.";

  @override
  void initState() {
    super.initState();
    controller.selectedTab.value = 0;
    controller.isExpanded.value = false;
    controller.currentPage.value = 0;
    controller.replyingToCommentId.value = "";
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult:
          (_, __) => Get.find<NavigationController>().popPage(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [const ImageSliderSection(), _buildContentSection()],
          ),
        ),
      ),
    );
  }

  Widget _buildContentSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 18, right: 18, top: 0),
      decoration: BoxDecoration(
        color: AppColors.white,
        gradient: AppStyles.linearGradient(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRecipeTitle(),
          const SizedBox(height: 4),
          _buildRecipeMetadataRow(),
          const SizedBox(height: 16),
          _buildDescription(),
          const SizedBox(height: 20),
          _buildRatingAndReview(),
          const SizedBox(height: 30),
          Divider(color: Color(0xFFD0DBEA), height: 0),
          const SizedBox(height: 20),
          _buildTabs(),
          const SizedBox(height: 30),
          Obx(
            () => Visibility(
              visible: controller.selectedTab.value == 0,
              child: IngredientsSection(),
            ),
          ),
          Obx(
            () => Visibility(
              visible: controller.selectedTab.value == 1,
              child: InstructionsSection(),
            ),
          ),
          Obx(
            () => Visibility(
              visible: controller.selectedTab.value == 2,
              child: VideoSection(),
            ),
          ),
          const SizedBox(height: 30),
          Obx(
            () => Visibility(
              visible:
                  controller.selectedTab.value == 0 ||
                  controller.selectedTab.value == 1,
              child: Column(
                children: [
                  Image.asset(PngAssets.recipeCustomDivider),
                  const SizedBox(height: 20),
                  CommentSection(),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return Obx(
      () => Row(
        children: [
          GestureDetector(
            onTap: () => controller.selectTab(0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                color:
                    controller.selectedTab.value == 0
                        ? AppColors.primary
                        : AppColors.transparent,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.30),
                ),
              ),
              child: Text(
                "Ingredients",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color:
                      controller.selectedTab.value == 0
                          ? AppColors.white
                          : AppColors.primary,
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () => controller.selectTab(1),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                color:
                    controller.selectedTab.value == 1
                        ? AppColors.primary
                        : AppColors.transparent,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.30),
                ),
              ),
              child: Text(
                "Instructions",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color:
                      controller.selectedTab.value == 1
                          ? AppColors.white
                          : AppColors.primary,
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () => controller.selectTab(2),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                color:
                    controller.selectedTab.value == 2
                        ? AppColors.primary
                        : AppColors.transparent,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.30),
                ),
              ),
              child: Text(
                "Video",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color:
                      controller.selectedTab.value == 2
                          ? AppColors.white
                          : AppColors.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingAndReview() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Recipe by: Henry",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: AppColors.grey,
              ),
            ),
            SizedBox(height: 6),
            Text(
              "Posted on April 5, 2025",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: AppColors.grey2,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 27,
          child: VerticalDivider(color: Color(0xFFD0DBEA), width: 0),
        ),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.border),
          ),
          child: Row(
            children: [
              Row(
                children: [
                  Image.asset(
                    PngAssets.commonStartIcon,
                    width: 16,
                    height: 16,
                    color: AppColors.warning,
                  ),
                  SizedBox(width: 4),
                  Text(
                    "4.8",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 10),
              CommonElevatedButton(
                height: 26,
                width: 75,
                fontSize: 12,
                buttonName: "All Review",
                onPressed: () {
                  Get.find<NavigationController>().pushNamed(
                    BaseRoute.customerReviews,
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return Obx(
      () => Text.rich(
        TextSpan(
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: AppColors.textTertiary,
          ),
          children: [
            TextSpan(
              text:
                  controller.isExpanded.value
                      ? description
                      : description.length > 80
                      ? '${description.substring(0, 80)}.. '
                      : description,
            ),
            if (!controller.isExpanded.value && description.length > 80)
              WidgetSpan(
                child: GestureDetector(
                  onTap: () {
                    controller.isExpanded.value = true;
                  },
                  child: Text(
                    "View More",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
          ],
        ),
        maxLines: controller.isExpanded.value ? null : 2,
      ),
    );
  }

  Widget _buildRecipeTitle() {
    return const Text(
      "Chicken Curry",
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 24,
        color: AppColors.textPrimary,
      ),
    );
  }

  Widget _buildRecipeMetadataRow() {
    return Row(
      children: [
        _buildMetadataItem(icon: PngAssets.commonFoodIcon, label: "Food"),
        const SizedBox(width: 10),
        _buildMetadataItem(
          icon: PngAssets.commonSuperEasyIcon,
          label: "Super Easy",
        ),
        const SizedBox(width: 10),
        _buildServingItem(),
        const SizedBox(width: 10),
        _buildMetadataItem(
          icon: PngAssets.commonClockColoredIcon,
          label: "25 mins",
        ),
      ],
    );
  }

  Widget _buildMetadataItem({required String icon, required String label}) {
    return Row(
      children: [
        Image.asset(icon, width: 12, height: 12),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: AppColors.textTertiary,
          ),
        ),
      ],
    );
  }

  Widget _buildServingItem() {
    return Row(
      children: [
        Image.asset(PngAssets.commonServingIcon, width: 12, height: 12),
        const SizedBox(width: 4),
        Text.rich(
          TextSpan(
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: AppColors.textTertiary,
            ),
            children: [
              const TextSpan(
                text: "4 ",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              const TextSpan(text: "Serving"),
            ],
          ),
        ),
      ],
    );
  }
}
