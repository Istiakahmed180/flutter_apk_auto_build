import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumio/src/app/contants/app_colors.dart';
import 'package:yumio/src/app/contants/assets_path/png_assets.dart';
import 'package:yumio/src/common/widgets/button/common_elevated_button.dart';
import 'package:yumio/src/common/widgets/text_field/common_text_input_field.dart';
import 'package:yumio/src/presentation/screens/recipe_details/controller/recipe_details_controller.dart';

class CommentSection extends StatefulWidget {
  const CommentSection({super.key});

  @override
  State<CommentSection> createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  final RecipeDetailsController controller = Get.find();
  final TextEditingController replyController = TextEditingController();
  String? replyingToId;
  String? replyingToParentId;

  final List<Map<String, dynamic>> commentList = [
    {
      "id": "1",
      "name": "Muhammad Salah",
      "time": "5 mins ago",
      "message":
          "A creamy, energizing plant-based milk blend with raw cacao and adaptogenic maca.",
      "isLiked": true,
      "likedCount": "24",
      "image": PngAssets.avatarOne,
      "replies": [
        {
          "id": "1-1",
          "name": "Sakib",
          "time": "2 mins ago",
          "message": "Thanks a Lot for sharing this amazing recipe!",
          "isLiked": false,
          "likedCount": "12",
          "image": PngAssets.avatarFive,
          "isAuthor": true,
          "authorName": "Istiak",
        },
      ],
    },
    {
      "id": "2",
      "name": "Emma Watson",
      "time": "15 mins ago",
      "message":
          "Has anyone tried making this with almond milk instead? How did it turn out?",
      "isLiked": false,
      "likedCount": "18",
      "image": PngAssets.avatarThree,
      "replies": [],
    },
    {
      "id": "3",
      "name": "David Miller",
      "time": "1 hour ago",
      "message":
          "This is my third time making this recipe this week! My kids are obsessed with it.",
      "isLiked": true,
      "likedCount": "32",
      "image": PngAssets.avatarSix,
      "replies": [],
    },
    {
      "id": "4",
      "name": "Priya Patel",
      "time": "2 hours ago",
      "message": "Can I use regular cocoa powder instead of raw cacao?",
      "isLiked": false,
      "likedCount": "7",
      "image": PngAssets.avatarEight,
      "replies": [],
    },
    {
      "id": "5",
      "name": "James Rodriguez",
      "time": "3 hours ago",
      "message":
          "The maca gives such a unique flavor profile. Perfect for morning energy!",
      "isLiked": true,
      "likedCount": "29",
      "image": PngAssets.avatarOne,
      "replies": [],
    },
    {
      "id": "6",
      "name": "Sarah Johnson",
      "time": "1 day ago",
      "message":
          "Made this for my yoga class and everyone loved it! Shared your recipe with all.",
      "isLiked": true,
      "likedCount": "42",
      "image": PngAssets.avatarThree,
      "replies": [],
    },
  ];

  void toggleReply(String? parentId, String? replyId) {
    setState(() {
      if (replyingToId == replyId && replyingToParentId == parentId) {
        replyingToId = null;
        replyingToParentId = null;
      } else {
        replyingToId = replyId;
        replyingToParentId = parentId;
      }
      replyController.clear();
    });
  }

  void submitReply() {
    if (replyController.text.isEmpty) return;

    setState(() {
      replyingToId = null;
      replyingToParentId = null;
      replyController.clear();
    });
  }

  @override
  void dispose() {
    replyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [_buildCommentTopBar(), _buildComments()]);
  }

  Widget _buildComments() {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.only(top: 16),
      itemBuilder: (context, index) {
        final comment = commentList[index];
        return Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(comment["image"], width: 40, height: 40),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              comment["name"],
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            const SizedBox(width: 6),
                            CircleAvatar(
                              radius: 3,
                              backgroundColor: AppColors.textTertiary,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              comment["time"],
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          comment["message"],
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 11,
                            color: AppColors.textTertiary,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                toggleReply(comment["id"], null);
                              },
                              child: Text(
                                "Reply",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: AppColors.textTertiary,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  comment["isLiked"] = !comment["isLiked"];
                                  if (comment["isLiked"]) {
                                    comment["likedCount"] =
                                        (int.parse(comment["likedCount"]) + 1)
                                            .toString();
                                  } else {
                                    comment["likedCount"] =
                                        (int.parse(comment["likedCount"]) - 1)
                                            .toString();
                                  }
                                });
                              },
                              child: Row(
                                children: [
                                  Image.asset(
                                    comment["isLiked"] == true
                                        ? PngAssets.commonHeartIcon
                                        : PngAssets.commonHeartRawIcon,
                                    width: 16,
                                    height: 16,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    comment["likedCount"],
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color:
                                          comment["isLiked"] == true
                                              ? AppColors.textPrimary
                                              : AppColors.grey2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (replyingToParentId == comment["id"] && replyingToId == null)
                _buildReplyTextField(comment["id"], null),

              if (comment["replies"].isNotEmpty)
                Column(
                  children: [
                    const SizedBox(height: 18),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Column(
                        children: [
                          for (var reply in comment["replies"])
                            Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Image.asset(
                                        reply["image"],
                                        width: 30,
                                        height: 30,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                reply["authorName"] ??
                                                    reply["name"],
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12,
                                                  color: AppColors.textPrimary,
                                                ),
                                              ),
                                              if (reply["isAuthor"] == true)
                                                const SizedBox(width: 3),
                                              if (reply["isAuthor"] == true)
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 4,
                                                    vertical: 3,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: AppColors.primary,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          4,
                                                        ),
                                                  ),
                                                  child: Text(
                                                    "Author",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 8,
                                                      color: AppColors.white,
                                                    ),
                                                  ),
                                                ),
                                              const SizedBox(width: 6),
                                              CircleAvatar(
                                                radius: 3,
                                                backgroundColor:
                                                    AppColors.textTertiary,
                                              ),
                                              const SizedBox(width: 6),
                                              Text(
                                                reply["time"],
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12,
                                                  color: AppColors.textPrimary,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 6),
                                          Text.rich(
                                            TextSpan(
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 11,
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: "${comment["name"]} ",
                                                  style: TextStyle(
                                                    color: AppColors.primary,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: reply["message"],
                                                  style: TextStyle(
                                                    color:
                                                        AppColors.textTertiary,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  toggleReply(
                                                    comment["id"],
                                                    reply["id"],
                                                  );
                                                },
                                                child: Text(
                                                  "Reply",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    color:
                                                        AppColors.textTertiary,
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    reply["isLiked"] =
                                                        !reply["isLiked"];
                                                    if (reply["isLiked"]) {
                                                      reply["likedCount"] =
                                                          (int.parse(
                                                                    reply["likedCount"],
                                                                  ) +
                                                                  1)
                                                              .toString();
                                                    } else {
                                                      reply["likedCount"] =
                                                          (int.parse(
                                                                    reply["likedCount"],
                                                                  ) -
                                                                  1)
                                                              .toString();
                                                    }
                                                  });
                                                },
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                      reply["isLiked"] == true
                                                          ? PngAssets
                                                              .commonHeartIcon
                                                          : PngAssets
                                                              .commonHeartRawIcon,
                                                      width: 16,
                                                      height: 16,
                                                    ),
                                                    const SizedBox(width: 6),
                                                    Text(
                                                      reply["likedCount"],
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12,
                                                        color:
                                                            reply["isLiked"] ==
                                                                    true
                                                                ? AppColors
                                                                    .textPrimary
                                                                : AppColors
                                                                    .grey2,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                if (replyingToParentId == comment["id"] &&
                                    replyingToId == reply["id"])
                                  _buildReplyTextField(
                                    comment["id"],
                                    reply["id"],
                                  ),
                                const SizedBox(height: 10),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 10);
      },
      itemCount: commentList.length,
    );
  }

  Widget _buildReplyTextField(String parentId, String? replyId) {
    return Column(
      children: [
        const SizedBox(height: 18),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(PngAssets.avatarFive, width: 40, height: 40),
            const SizedBox(width: 16),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.border),
                ),
                child: Column(
                  children: [
                    CommonTextInputField(
                      controller: replyController,
                      contentPadding: EdgeInsets.only(
                        top: 10,
                        left: 10,
                        right: 10,
                      ),
                      maxLines: 3,
                      borderRadius: 8,
                      borderColor: AppColors.transparent,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                PngAssets.commonEmojiIcon,
                                width: 18,
                                height: 18,
                              ),
                              const SizedBox(width: 10),
                              Image.asset(
                                PngAssets.commonGalleryIcon,
                                width: 18,
                                height: 18,
                              ),
                            ],
                          ),
                          CommonElevatedButton(
                            width: 50,
                            height: 26,
                            fontSize: 12,
                            buttonName: "Reply",
                            onPressed: submitReply,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCommentTopBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              "Comment",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(width: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.5, vertical: 7),
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColors.primary.withValues(alpha: 0.10),
              ),
              child: Text(
                "10",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7.5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.border),
          ),
          child: Row(
            children: [
              Text(
                "Newest First",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: AppColors.textTertiary,
                ),
              ),
              const SizedBox(width: 8),
              Image.asset(PngAssets.commonArrowDownIcon, width: 17, height: 17),
            ],
          ),
        ),
      ],
    );
  }
}
