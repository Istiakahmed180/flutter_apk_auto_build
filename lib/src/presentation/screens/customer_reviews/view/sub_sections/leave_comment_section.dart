import 'package:flutter/material.dart';
import 'package:yumio/src/app/contants/app_colors.dart';
import 'package:yumio/src/app/contants/assets_path/png_assets.dart';
import 'package:yumio/src/common/widgets/button/common_elevated_button.dart';
import 'package:yumio/src/common/widgets/text_field/common_text_input_field.dart';

class LeaveCommentSection extends StatelessWidget {
  const LeaveCommentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          CommonTextInputField(
            contentPadding: EdgeInsets.only(top: 16, left: 10, right: 10),
            hintText: "Leave a comment",
            maxLines: 3,
            borderRadius: 8,
            borderColor: AppColors.transparent,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
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
                  buttonName: "Send",
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
