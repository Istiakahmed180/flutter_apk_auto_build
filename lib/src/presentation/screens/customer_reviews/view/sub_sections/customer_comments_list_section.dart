import 'package:flutter/material.dart';
import 'package:yumio/src/app/contants/app_colors.dart';
import 'package:yumio/src/app/contants/assets_path/png_assets.dart';

class CustomerCommentsListSection extends StatelessWidget {
  const CustomerCommentsListSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> commentList = [
      {
        "image": PngAssets.avatarOne,
        "name": "Alex Johnson",
        "time": "2 mins ago",
        "rating": 5,
        "message":
            "Absolutely love this product! The taste is amazing and it gives me a great energy boost in the morning.",
        "attachmentImage": PngAssets.customerReview,
      },
      {
        "image": PngAssets.avatarTwo,
        "name": "Maria Garcia",
        "time": "15 mins ago",
        "rating": 4,
        "message":
            "Really good quality, though a bit pricey. Would recommend to friends who are into healthy alternatives.",
        "attachmentImage": PngAssets.customerReview,
      },
      {
        "image": PngAssets.avatarThree,
        "name": "James Wilson",
        "time": "1 hour ago",
        "rating": 3,
        "message":
            "Decent product but the flavor could be stronger. Packaging is nice though.",
        "attachmentImage": PngAssets.customerReview,
      },
      {
        "image": PngAssets.avatarFour,
        "name": "Sarah Lee",
        "time": "3 hours ago",
        "rating": 5,
        "message":
            "This has become my daily essential! Perfect for my vegan lifestyle and tastes delicious.",
        "attachmentImage": PngAssets.customerReview,
      },
      {
        "image": PngAssets.avatarFive,
        "name": "David Kim",
        "time": "5 hours ago",
        "rating": 2,
        "message":
            "Not what I expected. The texture is too grainy for my liking. Might not purchase again.",
        "attachmentImage": PngAssets.customerReview,
      },
      {
        "image": PngAssets.avatarSix,
        "name": "Emma Davis",
        "time": "1 day ago",
        "rating": 4,
        "message":
            "Great alternative to regular milk! My kids love it in their smoothies. Would buy again.",
        "attachmentImage": PngAssets.customerReview,
      },
      {
        "image": PngAssets.avatarSeven,
        "name": "Michael Brown",
        "time": "2 days ago",
        "rating": 5,
        "message":
            "Fantastic product! The adaptogenic maca really makes a difference in my energy levels throughout the day.",
        "attachmentImage": PngAssets.customerReview,
      },
      {
        "image": PngAssets.avatarEight,
        "name": "Olivia Martinez",
        "time": "3 days ago",
        "rating": 3,
        "message":
            "Good but not great. The cacao flavor is a bit too subtle for my taste. Maybe needs more sweetness.",
        "attachmentImage": PngAssets.customerReview,
      },
    ];

    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 18),
      itemBuilder: (context, index) {
        final comment = commentList[index];
        final rating = comment["rating"] as int;

        return Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.border),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(comment["image"], width: 40, height: 40),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                            color: AppColors.textTertiary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: List.generate(5, (starIndex) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 6),
                          child: Image.asset(
                            PngAssets.commonRatingStarIcon,
                            width: 10,
                            height: 10,
                            color:
                                starIndex < rating
                                    ? AppColors.warning
                                    : const Color(0xFFDDDDDD),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      comment["message"],
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 11,
                        color: AppColors.textTertiary,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        comment["attachmentImage"],
                        width: 86,
                        height: 56,
                      ),
                    ),
                  ],
                ),
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
}
