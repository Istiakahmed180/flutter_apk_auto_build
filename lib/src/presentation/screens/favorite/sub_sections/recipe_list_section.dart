import 'package:flutter/material.dart';
import 'package:yumio/src/app/contants/app_colors.dart';
import 'package:yumio/src/app/contants/assets_path/png_assets.dart';

class RecipeListSection extends StatelessWidget {
  const RecipeListSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> recipeList = [
      {
        "name": "Avocado Toast with Egg",
        "category": "Breakfast",
        "difficulty": "Easy",
        "rating": 4.7,
        "cookingTime": "10 mins",
        "image": PngAssets.categoryChipsOne,
      },
      {
        "name": "Spaghetti Carbonara",
        "category": "Italian",
        "difficulty": "Medium",
        "rating": 4.9,
        "cookingTime": "30 mins",
        "image": PngAssets.categoryChipsTwo,
      },
      {
        "name": "Vegetable Stir Fry",
        "category": "Asian",
        "difficulty": "Easy",
        "rating": 4.5,
        "cookingTime": "20 mins",
        "image": PngAssets.categoryChipsThree,
      },
      {
        "name": "Chocolate Chip Cookies",
        "category": "Dessert",
        "difficulty": "Medium",
        "rating": 4.8,
        "cookingTime": "45 mins",
        "image": PngAssets.categoryChipsFour,
      },
      {
        "name": "Grilled Salmon",
        "category": "Seafood",
        "difficulty": "Medium",
        "rating": 4.6,
        "cookingTime": "25 mins",
        "image": PngAssets.categoryChipsFive,
      },
      {
        "name": "Beef Bourguignon",
        "category": "French",
        "difficulty": "Hard",
        "rating": 4.9,
        "cookingTime": "3 hours",
        "image": PngAssets.categoryChipsSix,
      },
      {
        "name": "Mushroom Risotto",
        "category": "Italian",
        "difficulty": "Hard",
        "rating": 4.7,
        "cookingTime": "50 mins",
        "image": PngAssets.categoryChipsSeven,
      },
      {
        "name": "Chicken Caesar Salad",
        "category": "Salad",
        "difficulty": "Easy",
        "rating": 4.4,
        "cookingTime": "15 mins",
        "image": PngAssets.categoryChipsEight,
      },
      {
        "name": "Beef Tacos",
        "category": "Mexican",
        "difficulty": "Medium",
        "rating": 4.6,
        "cookingTime": "35 mins",
        "image": PngAssets.categoryChipsNine,
      },
    ];

    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.only(left: 18, right: 18, bottom: 30, top: 30),
        itemBuilder: (context, index) {
          final recipe = recipeList[index];

          return Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 11),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: AppColors.white,
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    recipe["image"],
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        recipe["name"],
                        maxLines: 1,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: AppColors.textPrimary,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "${recipe["category"]}/",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: AppColors.grey,
                              ),
                            ),
                            TextSpan(
                              text: recipe["difficulty"],
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Image.asset(
                            PngAssets.commonStarRawIcon,
                            width: 11,
                            height: 11,
                            color: AppColors.grey2,
                          ),
                          SizedBox(width: 4),
                          Text(
                            recipe["rating"].toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: AppColors.grey2,
                            ),
                          ),
                          SizedBox(width: 7),
                          Image.asset(
                            PngAssets.commonClockIcon,
                            width: 12,
                            height: 12,
                            color: AppColors.grey2,
                          ),
                          SizedBox(width: 4),
                          Text(
                            recipe["cookingTime"].toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: AppColors.grey2,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 12);
        },
        itemCount: recipeList.length,
      ),
    );
  }
}
