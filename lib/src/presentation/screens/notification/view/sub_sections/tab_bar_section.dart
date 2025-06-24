import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumio/src/app/contants/app_colors.dart';
import 'package:yumio/src/presentation/screens/notification/controller/notification_controller.dart';

class TabBarSection extends StatelessWidget {
  const TabBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotificationController());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          Obx(
            () => Row(
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(3),
                  onTap: () => controller.setSelectedTabIndex(0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            Text(
                              "All",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                                color:
                                    controller.selectedTab == 0
                                        ? AppColors.textPrimary
                                        : AppColors.grey2,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Container(
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: const Color(0xFFF2F4F7),
                              ),
                              child: Text(
                                textAlign: TextAlign.center,
                                "4",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 10,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 67,
                        height: 3,
                        decoration: BoxDecoration(
                          color:
                              controller.selectedTab == 0
                                  ? AppColors.primary
                                  : Colors.transparent,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(3),
                            topRight: Radius.circular(3),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(3),
                  onTap: () => controller.setSelectedTabIndex(1),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          "Unread",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                            color:
                                controller.selectedTab == 1
                                    ? AppColors.textPrimary
                                    : AppColors.grey2,
                          ),
                        ),
                      ),
                      Container(
                        width: 67,
                        height: 3,
                        decoration: BoxDecoration(
                          color:
                              controller.selectedTab == 1
                                  ? AppColors.primary
                                  : Colors.transparent,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(3),
                            topRight: Radius.circular(3),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(3),
                  onTap: () => controller.setSelectedTabIndex(2),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          "Read",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                            color:
                                controller.selectedTab == 2
                                    ? AppColors.textPrimary
                                    : AppColors.grey2,
                          ),
                        ),
                      ),
                      Container(
                        width: 67,
                        height: 3,
                        decoration: BoxDecoration(
                          color:
                              controller.selectedTab == 2
                                  ? AppColors.primary
                                  : Colors.transparent,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(3),
                            topRight: Radius.circular(3),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(color: AppColors.divider, height: 0),
        ],
      ),
    );
  }
}
