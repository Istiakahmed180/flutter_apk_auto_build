import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumio/src/app/contants/app_colors.dart';
import 'package:yumio/src/common/widgets/button/common_elevated_button.dart';

class SearchFilterSection extends StatefulWidget {
  const SearchFilterSection({super.key});

  @override
  State<SearchFilterSection> createState() => _SearchFilterSectionState();
}

class _SearchFilterSectionState extends State<SearchFilterSection> {
  String? selectedCategory;
  String? selectedDifficulty;
  String? selectedTime;

  final List<String> categories = [
    "Breakfast",
    "Lunch",
    "Dinner",
    "Desserts",
    "Italian",
    "Japanese",
    "Thai",
  ];
  final List<String> difficulties = ["Easy", "Medium", "Hard"];
  final List<String> times = ["Under 30 min", "30-60 min", "1 hr"];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.61,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          buildDividerSection(),
          SizedBox(height: 16),
          buildSearchFilterSection(),
          SizedBox(height: 30),
          buildCategoryFilterSection(),
          SizedBox(height: 16),
          buildDifficultyFilterSection(),
          SizedBox(height: 16),
          buildTimeFilterSection(),
          SizedBox(height: 42),
          buildShowRecipesButtonSection(),
          SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget buildShowRecipesButtonSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: CommonElevatedButton(
        buttonName: "Show Recipes",
        onPressed: () {
          Get.back();
        },
      ),
    );
  }

  Widget buildTimeFilterSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Time",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children:
                times.map((item) {
                  final isSelected = (selectedTime == item);

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTime = isSelected ? null : item;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 9.5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color:
                              isSelected
                                  ? AppColors.primary
                                  : AppColors.primary.withValues(alpha: 0.60),
                        ),
                        color:
                            isSelected ? AppColors.primary : Colors.transparent,
                      ),
                      child: Text(
                        item,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color:
                              isSelected
                                  ? AppColors.white
                                  : AppColors.textTertiary,
                        ),
                      ),
                    ),
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }

  Widget buildDifficultyFilterSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Difficulty",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children:
                difficulties.map((item) {
                  final isSelected = (selectedDifficulty == item);

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDifficulty = isSelected ? null : item;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 9.5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color:
                              isSelected
                                  ? AppColors.primary
                                  : AppColors.primary.withValues(alpha: 0.60),
                        ),
                        color:
                            isSelected ? AppColors.primary : Colors.transparent,
                      ),
                      child: Text(
                        item,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color:
                              isSelected
                                  ? AppColors.white
                                  : AppColors.textTertiary,
                        ),
                      ),
                    ),
                  );
                }).toList(),
          ),
          const SizedBox(height: 16),
          Divider(color: AppColors.border, height: 0),
        ],
      ),
    );
  }

  Widget buildCategoryFilterSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Category",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children:
                categories.map((item) {
                  final isSelected = (selectedCategory == item);

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = isSelected ? null : item;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 9.5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color:
                              isSelected
                                  ? AppColors.primary
                                  : AppColors.primary.withValues(alpha: 0.60),
                        ),
                        color:
                            isSelected ? AppColors.primary : Colors.transparent,
                      ),
                      child: Text(
                        item,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color:
                              isSelected
                                  ? AppColors.white
                                  : AppColors.textTertiary,
                        ),
                      ),
                    ),
                  );
                }).toList(),
          ),
          const SizedBox(height: 16),
          Divider(color: AppColors.border, height: 0),
        ],
      ),
    );
  }

  Widget buildSearchFilterSection() {
    return Center(
      child: Text(
        "Search Filter",
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 20,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }

  Widget buildDividerSection() {
    return Center(
      child: Container(
        width: 80,
        height: 5,
        decoration: BoxDecoration(
          color: AppColors.border,
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
