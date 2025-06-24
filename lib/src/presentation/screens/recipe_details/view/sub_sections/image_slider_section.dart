import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumio/src/app/contants/app_colors.dart';
import 'package:yumio/src/app/contants/assets_path/png_assets.dart';
import 'package:yumio/src/common/controller/navigation_controller.dart';
import 'package:yumio/src/presentation/screens/recipe_details/controller/recipe_details_controller.dart';

class ImageSliderSection extends StatefulWidget {
  const ImageSliderSection({super.key});

  @override
  State<ImageSliderSection> createState() => _ImageSliderSectionState();
}

class _ImageSliderSectionState extends State<ImageSliderSection> {
  final RecipeDetailsController controller = Get.find();
  final PageController pageController = PageController();

  final List<String> recipeImages = [
    PngAssets.recipeRawOne,
    PngAssets.recipeRawTwo,
    PngAssets.recipeRawThree,
  ];

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: 300,
          child: PageView.builder(
            controller: pageController,
            itemCount: recipeImages.length,
            onPageChanged: (index) {
              controller.currentPage.value = index;
            },
            itemBuilder: (context, index) {
              return Image.asset(
                recipeImages[index],
                width: double.infinity,
                fit: BoxFit.fill,
              );
            },
          ),
        ),
        Positioned(
          bottom: 50,
          child: Obx(
            () => Row(
              children: List.generate(
                recipeImages.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  width: controller.currentPage.value == index ? 11 : 7,
                  height: controller.currentPage.value == index ? 11 : 7,
                  decoration: BoxDecoration(
                    color:
                        controller.currentPage.value == index
                            ? AppColors.white
                            : AppColors.white,
                    shape: BoxShape.circle,
                  ),
                  child:
                      controller.currentPage.value == index
                          ? Center(
                            child: Container(
                              width: 7,
                              height: 7,
                              decoration: const BoxDecoration(
                                color: AppColors.primary,
                                shape: BoxShape.circle,
                              ),
                            ),
                          )
                          : null,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 16,
          left: 18,
          child: GestureDetector(
            onTap: () {
              Get.find<NavigationController>().popPage();
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                child: Container(
                  padding: EdgeInsets.all(8),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(0xFF929292).withValues(alpha: 0.20),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.asset(
                    PngAssets.commonLeftArrowIcon,
                    width: 24,
                    height: 24,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          child: Image.asset(PngAssets.recipeDetailsShape),
        ),
      ],
    );
  }
}
