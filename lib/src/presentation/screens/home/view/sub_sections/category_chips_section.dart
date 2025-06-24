import 'package:flutter/material.dart';
import 'package:yumio/src/app/contants/app_colors.dart';
import 'package:yumio/src/app/contants/assets_path/png_assets.dart';

class CategoryChipsSection extends StatelessWidget {
  const CategoryChipsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categoryChips = [
      {"title": "Chicken Curry", "image": PngAssets.categoryChipsOne},
      {"title": "Fish Curry", "image": PngAssets.categoryChipsTwo},
      {"title": "Chicken in Sauce", "image": PngAssets.categoryChipsThree},
      {"title": "Thai Green Curry", "image": PngAssets.categoryChipsFour},
      {"title": "Japanese Sushi", "image": PngAssets.categoryChipsFive},
      {"title": "Chinese Dumpling", "image": PngAssets.categoryChipsSix},
      {"title": "Korean Bibimbap", "image": PngAssets.categoryChipsSeven},
      {"title": "Vietnamese Pho", "image": PngAssets.categoryChipsEight},
      {"title": "Indian Biryani", "image": PngAssets.categoryChipsNine},
    ];

    return SizedBox(
      height: 90,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return SizedBox(width: 10);
        },
        padding: EdgeInsets.symmetric(horizontal: 18),
        scrollDirection: Axis.horizontal,
        itemCount: categoryChips.length,
        itemBuilder: (context, index) {
          final chips = categoryChips[index];
          return Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  chips['image'],
                  width: 82,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    PngAssets.categoryChipsShape,
                    width: 82,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                left: 8,
                bottom: 8,
                right: 22,
                child: Text(
                  chips['title'],
                  style: const TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 11,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
