import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:yumio/src/app/contants/app_colors.dart';
import 'package:yumio/src/app/contants/assets_path/png_assets.dart';

class VideoSection extends StatelessWidget {
  const VideoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                PngAssets.videoPreview,
                width: double.infinity,
                height: 177,
                fit: BoxFit.fill,
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 2, sigmaX: 2),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.black.withValues(alpha: 0.40),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Image.asset(
                    PngAssets.commonPlayIcon,
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Full Chicken curry cooking video",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: AppColors.textPrimary,
              ),
            ),
            Row(
              children: [
                Image.asset(
                  PngAssets.commonShowEyeIcon,
                  width: 16,
                  height: 16,
                  color: AppColors.grey2,
                ),
                const SizedBox(width: 4),
                Text(
                  "112 View",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: AppColors.grey2,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
