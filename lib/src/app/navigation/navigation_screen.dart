import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumio/src/app/navigation/custom_navigation_items.dart';
import 'package:yumio/src/common/controller/navigation_controller.dart';
import 'package:yumio/src/presentation/screens/home/controller/home_controller.dart';
import 'package:yumio/src/presentation/screens/home/view/sub_sections/drawer_section.dart';
import 'package:yumio/src/presentation/screens/home/view/sub_sections/end_drawer_section.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final NavigationController navigationController =
      Get.find<NavigationController>();
  final HomeController homeController = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    homeController.setScaffoldKey(_scaffoldKey);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(),
      drawer: DrawerSection(),
      endDrawer: EndDrawerSection(),
      body: GetBuilder<NavigationController>(
        builder: (controller) {
          return Obx(() => controller.currentPage);
        },
      ),
      bottomNavigationBar: const CustomNavigationItems(),
    );
  }
}
