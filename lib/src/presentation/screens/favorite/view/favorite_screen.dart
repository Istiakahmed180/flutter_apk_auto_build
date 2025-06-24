import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumio/src/app/routes/routes.dart';
import 'package:yumio/src/common/controller/navigation_controller.dart';
import 'package:yumio/src/presentation/screens/favorite/sub_sections/recipe_list_section.dart';
import 'package:yumio/src/presentation/widgets/common_top_bar.dart';
import 'package:yumio/src/presentation/widgets/search_recipes_section.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NavigationController>();

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        controller.selectedIndex.value = 0;
      },
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 16),
            CommonTopBar(
              title: "My Favorites",
              onPressed: () {
                controller.selectedIndex.value = 0;
              },
              rightSideOnPressed: () {
                Get.find<NavigationController>().pushNamed(
                  BaseRoute.notification,
                );
              },
            ),
            SizedBox(height: 16),
            SearchRecipesSection(),
            RecipeListSection(),
          ],
        ),
      ),
    );
  }
}
