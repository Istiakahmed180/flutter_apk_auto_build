import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumio/src/app/contants/app_colors.dart';
import 'package:yumio/src/app/contants/assets_path/png_assets.dart';
import 'package:yumio/src/app/routes/routes.dart';
import 'package:yumio/src/common/widgets/button/common_elevated_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;
  CarouselSliderController carouselController = CarouselSliderController();

  final List<Map<String, String>> onboardingContent = [
    {
      "title": "Explore\nThousands of\nRecipes",
      "subTitle": "Find inspiration from global cuisines",
      "image": PngAssets.onboardingOne,
    },
    {
      "title": "Personalize Your\nTaste",
      "subTitle": "Set your dietary preferences and restrictions.",
      "image": PngAssets.onboardingTwo,
    },
    {
      "title": "Save & Share\nYour Favorites",
      "subTitle": "Bookmark and share recipes with friends &\nfamily",
      "image": PngAssets.onboardingThree,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isLastPage = currentPage == (onboardingContent.length) - 1;

    return Scaffold(
      appBar: AppBar(),
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          Positioned(
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Image.asset(PngAssets.onboardingShape),
            ),
          ),
          Column(
            children: [
              Expanded(
                flex: 8,
                child: CarouselSlider.builder(
                  carouselController: carouselController,
                  itemCount: onboardingContent.length,
                  itemBuilder: (context, index, realIndex) {
                    final onboarding = onboardingContent[index];

                    return onBoardingPage(
                      image: onboarding["image"]!,
                      title: onboarding["title"]!,
                      subTitle: onboarding["subTitle"]!,
                    );
                  },
                  options: CarouselOptions(
                    height: double.infinity,
                    viewportFraction: 1.0,
                    enableInfiniteScroll: false,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentPage = index;
                      });
                    },
                    autoPlay: false,
                    enlargeCenterPage: false,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          onboardingContent.length,
                          (index) => GestureDetector(
                            onTap: () {
                              carouselController.animateToPage(index);
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.symmetric(horizontal: 6),
                              width: currentPage == index ? 14 : 7,
                              height: currentPage == index ? 14 : 7,
                              decoration: BoxDecoration(
                                color:
                                    currentPage == index
                                        ? AppColors.primary.withValues(
                                          alpha: 0.24,
                                        )
                                        : AppColors.indicator,
                                shape: BoxShape.circle,
                              ),
                              child:
                                  currentPage == index
                                      ? Center(
                                        child: Container(
                                          width: 7,
                                          height: 7,
                                          decoration: BoxDecoration(
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

                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child:
                          isLastPage
                              ? CommonElevatedButton(
                                buttonName: "Get Started",
                                onPressed: () => Get.toNamed(BaseRoute.signIn),
                              )
                              : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      carouselController.animateToPage(
                                        onboardingContent.length - 1,
                                      );
                                    },
                                    child: Text(
                                      "Skip",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.textPrimary.withValues(
                                          alpha: 0.8,
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      carouselController.nextPage();
                                    },
                                    child: Text(
                                      "Next",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.textPrimary.withValues(
                                          alpha: 0.8,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget onBoardingPage({
    required String image,
    required String title,
    required String subTitle,
  }) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 80),
          Center(
            child: Image.asset(
              image,
              width:
                  currentPage == 0
                      ? 300
                      : currentPage == 1
                      ? 320
                      : currentPage == 2
                      ? 360
                      : null,
              height: 300,
            ),
          ),
          const SizedBox(height: 80),
          Padding(
            padding: EdgeInsets.only(left: 24),
            child: Text(
              title,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 24),
            child: Text(
              subTitle,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: AppColors.textTertiary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
