import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  GlobalKey<ScaffoldState>? _scaffoldKey;
  final RxInt _selectedDrawerIndex = 0.obs;
  final RxInt _selectedEndDrawerIndex = 0.obs;

  int get selectedDrawerIndex => _selectedDrawerIndex.value;

  int get selectedEndDrawerIndex => _selectedEndDrawerIndex.value;

  void setScaffoldKey(GlobalKey<ScaffoldState> key) {
    _scaffoldKey = key;
  }

  void openEndDrawer() {
    _scaffoldKey!.currentState!.openEndDrawer();
  }

  void openDrawer() {
    _scaffoldKey!.currentState!.openDrawer();
  }

  void setSelectedDrawerIndex(int index) {
    _selectedDrawerIndex.value = index;
  }

  void setSelectedEndDrawerIndex(int index) {
    _selectedEndDrawerIndex.value = index;
  }
}
