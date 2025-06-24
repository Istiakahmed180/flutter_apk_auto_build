import 'package:flutter/material.dart';
import 'package:yumio/src/app/contants/app_colors.dart';
import 'package:yumio/src/app/contants/assets_path/png_assets.dart';

class InstructionsSection extends StatelessWidget {
  const InstructionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final instructions = [
      {
        "title": "Sauté Aromatics",
        "description":
            "Heat oil in a large pan over medium heat. Add cumin seeds (if using), then onions. Cook until golden brown.",
      },
      {
        "title": "Add Garlic, Ginger, and Tomatoes",
        "description":
            "Stir in garlic and ginger, cook 1 minute. Add tomatoes, and cook until soft and oil begins to separate.",
      },
      {
        "title": "Add Spices",
        "description":
            "Stir in turmeric, coriander, chili powder, and salt. Cook 2–3 mins to toast the spices.",
      },
      {
        "title": "Cook Chicken",
        "description":
            "Add chicken pieces, stir to coat. Cook until lightly browned, about 5–7 minutes.",
      },
      {
        "title": "Add Yogurt or Coconut Milk",
        "description":
            "Lower heat and mix in yogurt (or coconut milk), stirring well. Simmer for 3–4 minutes.",
      },
      {
        "title": "Add Water/Broth & Simmer",
        "description":
            "Add 1 cup of water or broth. Cover and simmer 15–20 minutes until chicken is cooked through and sauce thickens.",
      },
      {
        "title": "Finish with Garam Masala",
        "description": "Stir in garam masala, simmer 2 more minutes.",
      },
      {
        "title": "Serve",
        "description":
            "Garnish with fresh cilantro. Serve with steamed rice, naan, or roti.",
      },
    ];

    return Column(
      children:
          instructions
              .map(
                (step) => _buildInstructionStep(
                  title: step["title"]!,
                  description: step["description"]!,
                ),
              )
              .toList(),
    );
  }

  Widget _buildInstructionStep({
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                PngAssets.commonCheckRadiusIcon,
                width: 20,
                height: 20,
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              description,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
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
