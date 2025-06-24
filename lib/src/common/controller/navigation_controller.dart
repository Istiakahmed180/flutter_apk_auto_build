import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumio/src/app/routes/routes_handler.dart';
import 'package:yumio/src/presentation/screens/favorite/view/favorite_screen.dart';
import 'package:yumio/src/presentation/screens/home/view/home_screen.dart';
import 'package:yumio/src/presentation/screens/setting/view/setting_screen.dart';
import 'package:yumio/src/presentation/screens/subscription/view/subscription_screen.dart';

class NavigationController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  final Map<String, dynamic> _routeArguments = {};

  final List<List<Widget>> pageStacks = [
    [HomeScreen()],
    [FavoriteScreen()],
    [SubscriptionScreen()],
    [SettingScreen()],
  ];

  void onTapItem(int index) {
    if (selectedIndex.value == index && pageStacks[index].length > 1) {
      pageStacks[index] = [pageStacks[index].first];
      update();
    }
    selectedIndex.value = index;
  }

  void pushPage(Widget page) {
    pageStacks[selectedIndex.value].add(page);
    update();
  }

  void pushNamed(String routeName, {dynamic arguments}) {
    if (kDebugMode) {
      print('Pushing route: $routeName with arguments: $arguments');
    }

    final route = _findRoute(routeName);
    if (route != null) {
      if (arguments != null) {
        _routeArguments[routeName] = arguments;
      }

      final widget = route.page();
      pageStacks[selectedIndex.value].add(widget);
      update();
    } else {
      throw Exception('Route $routeName not found');
    }
  }

  void pushOffNamed(String routeName, {dynamic arguments}) {
    if (kDebugMode) {
      print('Push off route: $routeName with arguments: $arguments');
    }

    final route = _findRoute(routeName);
    if (route != null) {
      if (arguments != null) {
        _routeArguments[routeName] = arguments;
      }

      if (pageStacks[selectedIndex.value].isNotEmpty) {
        pageStacks[selectedIndex.value].removeLast();
      }
      final widget = route.page();
      pageStacks[selectedIndex.value].add(widget);
      update();
    } else {
      throw Exception('Route $routeName not found');
    }
  }

  void pushOffAllNamed(String routeName, {dynamic arguments}) {
    if (kDebugMode) {
      print('Push off all route: $routeName with arguments: $arguments');
    }

    final route = _findRoute(routeName);
    if (route != null) {
      if (arguments != null) {
        _routeArguments[routeName] = arguments;
      }

      final widget = route.page();
      pageStacks[selectedIndex.value] = [widget];
      update();
    } else {
      throw Exception('Route $routeName not found');
    }
  }

  dynamic getArguments(String routeName) {
    return _routeArguments[routeName];
  }

  GetPage? _findRoute(String routeName) {
    if (kDebugMode) {
      print('GOING TO ROUTE: $routeName');
    }
    try {
      return routesHandler.firstWhere((route) => route.name == routeName);
    } catch (e) {
      if (kDebugMode) {
        print('Route not found: $routeName');
      }
      return null;
    }
  }

  bool popPage() {
    if (pageStacks[selectedIndex.value].length > 1) {
      pageStacks[selectedIndex.value].removeLast();
      update();
      return true;
    }
    return false;
  }

  Widget get currentPage => pageStacks[selectedIndex.value].last;
}
