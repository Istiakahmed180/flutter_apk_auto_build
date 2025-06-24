import 'package:flutter/material.dart';
import 'package:yumio/src/presentation/screens/home/view/sub_sections/banner_section.dart';
import 'package:yumio/src/presentation/screens/home/view/sub_sections/categories_section.dart';
import 'package:yumio/src/presentation/screens/home/view/sub_sections/category_chips_section.dart';
import 'package:yumio/src/presentation/screens/home/view/sub_sections/divider_section.dart';
import 'package:yumio/src/presentation/screens/home/view/sub_sections/title_and_see_all_section.dart';
import 'package:yumio/src/presentation/screens/home/view/sub_sections/top_bar_section.dart';
import 'package:yumio/src/presentation/widgets/recipes_section.dart';
import 'package:yumio/src/presentation/widgets/search_recipes_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Column(
            children: [
              const SizedBox(height: 12),
              const TopBarSection(),
              const SizedBox(height: 16),
              const DividerSection(),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const CategoryChipsSection(),
                  const SizedBox(height: 20),
                  const SearchRecipesSection(),
                  const SizedBox(height: 20),
                  const BannerSection(),
                  const SizedBox(height: 20),
                  const TitleAndSeeAllSection(title: "Categories"),
                  const SizedBox(height: 16),
                  const CategoriesSection(),
                  const SizedBox(height: 20),
                  const TitleAndSeeAllSection(title: "Recipes"),
                  const SizedBox(height: 16),
                  const RecipesSection(),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
