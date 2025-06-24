import 'package:flutter/material.dart';
import 'package:yumio/src/app/contants/app_colors.dart';
import 'package:yumio/src/app/contants/assets_path/png_assets.dart';

class IngredientsSection extends StatelessWidget {
  const IngredientsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ingredients = [
      "1.5 lbs (700g) chicken (boneless, skinless thighs or breasts), cut into chunks",
      "2 tbsp oil or ghee",
      "1 large onion, finely chopped",
      "3 cloves garlic, minced",
      "1-inch piece ginger, minced",
      "2 tomatoes, chopped (or 1 cup canned crushed tomatoes)",
      "1/2 cup plain yogurt or coconut milk",
      "1 cup water or chicken broth",
      "Fresh cilantro (for garnish)",
    ];

    return Column(
      children:
          ingredients
              .map((ingredient) => _buildIngredientRow(ingredient))
              .toList(),
    );
  }

  Widget _buildIngredientRow(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Transform.translate(
            offset: Offset(0, -01.5),
            child: Image.asset(
              PngAssets.commonCheckRadiusIcon,
              width: 20,
              height: 20,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: AppColors.textTertiary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
