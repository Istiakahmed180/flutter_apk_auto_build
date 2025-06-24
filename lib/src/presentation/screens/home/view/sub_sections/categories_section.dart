import 'package:flutter/material.dart';
import 'package:yumio/src/app/contants/app_colors.dart';
import 'package:yumio/src/app/contants/assets_path/png_assets.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {"title": "Breakfast", "image": PngAssets.categoryOne},
      {"title": "Lunch", "image": PngAssets.categoryTwo},
      {"title": "Dinner", "image": PngAssets.categoryThree},
      {"title": "Desserts", "image": PngAssets.categoryFour},
      {"title": "Snacks", "image": PngAssets.categoryFive},
    ];

    return SizedBox(
      height: 80,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return SizedBox(width: 8);
        },
        padding: EdgeInsets.symmetric(horizontal: 18),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Container(
            width: 84,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.border),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(category['image'], width: 26, height: 26),
                SizedBox(height: 8),
                Text(
                  category["title"],
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    color: AppColors.textTertiary,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
