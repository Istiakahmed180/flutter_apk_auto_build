import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:yumio/src/app/contants/app_colors.dart';
import 'package:yumio/src/app/contants/assets_path/png_assets.dart';
import 'package:yumio/src/app/routes/routes.dart';
import 'package:yumio/src/common/controller/navigation_controller.dart';

class RecipesSection extends StatefulWidget {
  const RecipesSection({super.key});

  @override
  State<RecipesSection> createState() => _RecipesSectionState();
}

class _RecipesSectionState extends State<RecipesSection> {
  final List<Map<String, dynamic>> recipesList = [
    {
      "name": "Chicken curry",
      "category": "Breakfast",
      "cuisine": "Asian",
      "cookingTime": "30 mins",
      "rating": 4.8,
      "shape": PngAssets.recipeShapeOne,
      "image": PngAssets.recipeOne,
      "height": 230.0,
      "isFavorite": false,
    },
    {
      "name": "Beef tataki",
      "category": "Lunch",
      "cuisine": "Japanese",
      "cookingTime": "30 mins",
      "rating": 4.8,
      "shape": PngAssets.recipeShapeTwo,
      "image": PngAssets.recipeTwo,
      "height": 170.0,
      "isFavorite": true,
    },
    {
      "name": "Chicken curry",
      "category": "Desserts",
      "cuisine": "Malay",
      "cookingTime": "30 mins",
      "rating": 4.8,
      "shape": PngAssets.recipeShapeOne,
      "image": PngAssets.recipeFour,
      "height": 230.0,
      "isFavorite": false,
    },
    {
      "name": "Vegetables Food",
      "category": "Dinner",
      "cuisine": "Thai",
      "cookingTime": "30 mins",
      "rating": 4.8,
      "shape": PngAssets.recipeShapeTwo,
      "image": PngAssets.recipeThree,
      "height": 170.0,
      "isFavorite": false,
    },
    {
      "name": "Spaghetti Carbonara",
      "category": "Dinner",
      "cuisine": "Italian",
      "cookingTime": "25 mins",
      "rating": 4.9,
      "shape": PngAssets.recipeShapeOne,
      "image": PngAssets.recipeFive,
      "height": 230.0,
      "isFavorite": true,
    },
    {
      "name": "Avocado Toast",
      "category": "Breakfast",
      "cuisine": "Western",
      "cookingTime": "10 mins",
      "rating": 4.5,
      "shape": PngAssets.recipeShapeTwo,
      "image": PngAssets.recipeSix,
      "height": 170.0,
      "isFavorite": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: MasonryGridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        mainAxisSpacing: 20,
        crossAxisSpacing: 18,
        itemCount: recipesList.length,
        itemBuilder: (context, index) {
          final recipe = recipesList[index];
          return _buildRecipeCard(recipe, index);
        },
      ),
    );
  }

  Widget _buildRecipeCard(Map<String, dynamic> recipe, int index) {
    return GestureDetector(
      onTap: () {
        Get.find<NavigationController>().pushNamed(BaseRoute.recipesDetails);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: recipe['height'],
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset(
                    recipe['image'],
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.asset(
                      recipe["shape"],
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        recipesList[index]['isFavorite'] =
                            !(recipesList[index]['isFavorite'] ?? false);
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Image.asset(
                        PngAssets.commonHeartIcon,
                        width: 16,
                        height: 16,
                        color:
                            recipe["isFavorite"] == true
                                ? AppColors.primary
                                : Color(0xFFDBDBDB),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.white.withValues(alpha: 0.20),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              PngAssets.commonStartIcon,
                              width: 12,
                              height: 12,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              recipe['rating'].toString(),
                              style: const TextStyle(
                                color: AppColors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 12,
                  left: 10,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        PngAssets.commonClockIcon,
                        width: 12,
                        height: 12,
                        color: AppColors.white,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        recipe["cookingTime"],
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 11,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Text(
            recipe['category'],
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            recipe['name'],
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          Text(
            recipe['cuisine'],
            style: TextStyle(
              fontSize: 14,
              color: AppColors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
