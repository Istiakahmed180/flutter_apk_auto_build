import 'package:get/get.dart';

class NotificationController extends GetxController {
  final RxInt _selectedTab = 0.obs;

  int get selectedTab => _selectedTab.value;

  void setSelectedTabIndex(int index) {
    _selectedTab.value = index;
  }
}
