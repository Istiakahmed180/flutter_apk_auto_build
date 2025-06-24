import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumio/src/app/routes/routes.dart';
import 'package:yumio/src/common/controller/navigation_controller.dart';
import 'package:yumio/src/presentation/widgets/common_top_bar.dart';
import 'package:yumio/src/presentation/widgets/recipes_section.dart';
import 'package:yumio/src/presentation/widgets/search_recipes_section.dart';

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NavigationController>();

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        controller.popPage();
      },
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 16),
            _buildCommonTopBar(controller),
            SizedBox(height: 16),
            SearchRecipesSection(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    RecipesSection(),
                    SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCommonTopBar(NavigationController controller) {
    return CommonTopBar(
      title: "My Recipe",
      onPressed: () {
        controller.popPage();
      },
      rightSideOnPressed: () {
        Get.find<NavigationController>().pushNamed(BaseRoute.notification);
      },
    );
  }
}
