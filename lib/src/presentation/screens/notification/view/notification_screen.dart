import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumio/src/app/contants/app_colors.dart';
import 'package:yumio/src/app/contants/assets_path/png_assets.dart';
import 'package:yumio/src/common/controller/navigation_controller.dart';
import 'package:yumio/src/common/widgets/button/common_elevated_button.dart';
import 'package:yumio/src/presentation/screens/notification/view/sub_sections/tab_bar_section.dart';
import 'package:yumio/src/presentation/widgets/common_top_bar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationController = Get.find<NavigationController>();

    final List<Map<String, dynamic>> notificationList = [
      {
        "id": "1",
        "type": "access_request",
        "userName": "Ashwin Bose",
        "content": "Design File - Final Project",
        "fileReference": "Design Files/Final Project.sketch",
        "time": "2m",
        "isRead": false,
        "userAvatar": PngAssets.placeholder,
      },

      {
        "id": "3",
        "type": "comment",
        "userName": "Patrick",
        "content": "Looks perfect, send it for technical review...",
        "fileReference": "Design Assets/Smart Tags.sketch",
        "time": "1h",
        "isRead": true,
        "userAvatar": PngAssets.placeholder,
      },
      {
        "id": "4",
        "type": "comment",
        "userName": "Sarah Johnson",
        "content": "I have some suggestions for the layout",
        "fileReference": "Marketing/Homepage Design.fig",
        "time": "3h",
        "isRead": false,
        "userAvatar": PngAssets.placeholder,
      },
      {
        "id": "5",
        "type": "mention",
        "userName": "Michael Chen",
        "content": "Please review my changes to the API docs",
        "fileReference": "Technical/API Documentation v2.1.md",
        "time": "5h",
        "isRead": false,
        "userAvatar": PngAssets.placeholder,
      },
      {
        "id": "6",
        "type": "mention",
        "userName": "Lisa Wong",
        "content": "Check the budget numbers I added",
        "fileReference": "Finance/Q3 Budget.xlsx",
        "time": "2h",
        "isRead": true,
        "userAvatar": PngAssets.placeholder,
      },
      {
        "id": "7",
        "type": "approval",
        "userName": "David Kim",
        "content": "Approved your design changes",
        "fileReference": "Design/New Icons Set.sketch",
        "time": "1d",
        "isRead": true,
        "userAvatar": PngAssets.placeholder,
      },
      {
        "id": "8",
        "type": "approval",
        "userName": "HR System",
        "content": "Your vacation request was approved",
        "fileReference": "Marketing/Brand Assets.zip",
        "time": "3d",
        "isRead": false,
        "userAvatar": PngAssets.placeholder,
      },
      {
        "id": "9",
        "type": "system",
        "userName": "System",
        "content": "New version available for review",
        "fileReference": "Releases/v2.3.0 Release Notes.pdf",
        "time": "2d",
        "isRead": false,
        "userAvatar": PngAssets.placeholder,
      },
      {
        "id": "10",
        "type": "system",
        "userName": "System",
        "content": "Your storage is 85% full",
        "fileReference": "Marketing/Brand Assets.zip",
        "time": "4d",
        "isRead": true,
        "userAvatar": PngAssets.placeholder,
      },
      {
        "id": "11",
        "type": "update",
        "userName": "Project Bot",
        "content": "File was updated by team member",
        "fileReference": "Projects/Client Portal/Homepage.js",
        "time": "4h",
        "isRead": false,
        "userAvatar": PngAssets.placeholder,
      },
      {
        "id": "12",
        "type": "update",
        "userName": "Version Control",
        "content": "New changes pushed to branch",
        "fileReference": "git/feature/new-authentication",
        "time": "6h",
        "isRead": true,
        "userAvatar": PngAssets.placeholder,
      },
      {
        "id": "13",
        "type": "invitation",
        "userName": "Team Collaboration",
        "content": "You've been invited to edit document",
        "fileReference": "Shared/Product Requirements.docx",
        "time": "6h",
        "isRead": false,
        "userAvatar": PngAssets.placeholder,
      },
      {
        "id": "14",
        "type": "invitation",
        "userName": "Project Team",
        "content": "Invitation to join project channel",
        "fileReference": "Marketing/Brand Assets.zip",
        "time": "1d",
        "isRead": true,
        "userAvatar": PngAssets.placeholder,
      },
      {
        "id": "15",
        "type": "shared",
        "userName": "Alex Turner",
        "content": "Shared a file with you",
        "fileReference": "Resources/User Research Findings.pdf",
        "time": "8h",
        "isRead": false,
        "userAvatar": PngAssets.placeholder,
      },
      {
        "id": "16",
        "type": "shared",
        "userName": "Marketing Team",
        "content": "New assets shared with your team",
        "fileReference": "Marketing/Brand Assets.zip",
        "time": "1d",
        "isRead": true,
        "userAvatar": PngAssets.placeholder,
      },
    ];

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        navigationController.popPage();
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Column(
          children: [
            const SizedBox(height: 16),
            _buildCommonTopBar(navigationController),
            const SizedBox(height: 16),
            TabBarSection(),
            _buildNotificationItemsSection(notificationList),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationItemsSection(
    List<Map<String, dynamic>> notificationList,
  ) {
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.only(top: 20),
        separatorBuilder: (context, index) {
          return Column(
            children: [Divider(color: AppColors.border, height: 0)],
          );
        },
        itemCount: notificationList.length,
        itemBuilder: (context, index) {
          final notification = notificationList[index];
          if (notification['type'] == 'access_request') {
            return _buildAccessRequestNotification(
              userName: notification['userName'],
              content: notification['content'],
              time: notification['time'],
              isRead: notification['isRead'],
            );
          } else {
            return _buildCommentNotification(
              userName: notification['userName'],
              content: notification['content'],
              time: notification['time'],
              fileReference: notification['fileReference'],
            );
          }
        },
      ),
    );
  }

  Widget _buildCommonTopBar(NavigationController controller) {
    return CommonTopBar(
      title: "Notification",
      isShowRightSideIcon: false,
      onPressed: () {
        controller.popPage();
      },
    );
  }

  Widget _buildAccessRequestNotification({
    required String userName,
    required String content,
    required String time,
    required bool isRead,
  }) {
    return Container(
      padding: EdgeInsets.all(18),
      color: AppColors.background,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Transform.translate(
            offset: Offset(0, -03),
            child: Image.asset(PngAssets.placeholder, width: 38, height: 38),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      TextSpan(
                        text: userName,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      TextSpan(
                        text: " is requesting access to ",
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                      TextSpan(
                        text: content,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    CommonElevatedButton(
                      fontSize: 12,
                      width: 82,
                      height: 30,
                      buttonName: "Accept",
                      onPressed: () {},
                    ),
                    SizedBox(width: 8),
                    CommonElevatedButton(
                      textColor: AppColors.textPrimary,
                      backgroundColor: AppColors.white,
                      fontSize: 12,
                      width: 82,
                      height: 30,
                      buttonName: "Decline",
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 12),
          Transform.translate(
            offset: Offset(0, -03),
            child: Column(
              children: [
                Text(
                  time,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: AppColors.grey2,
                  ),
                ),
                SizedBox(height: 5),
                if (!isRead)
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentNotification({
    required String userName,
    required String content,
    required String time,
    required String fileReference,
  }) {
    return Container(
      padding: EdgeInsets.all(18),
      color: AppColors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Transform.translate(
            offset: Offset(0, -03),
            child: Image.asset(PngAssets.placeholder, width: 38, height: 38),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.textTertiary,
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      TextSpan(
                        text: userName,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      TextSpan(text: " added a comment on "),
                      TextSpan(
                        text: "$fileReference:",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    SizedBox(
                      height: 20,
                      child: VerticalDivider(
                        width: 0,
                        color: Color(0xFFE2E8F0),
                        thickness: 2.0,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      '"$content',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: AppColors.grey2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 12),
          Transform.translate(
            offset: Offset(0, -03),
            child: Text(
              time,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: AppColors.grey2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
