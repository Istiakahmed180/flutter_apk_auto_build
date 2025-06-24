import 'package:flutter/material.dart';
import 'package:yumio/src/app/contants/app_colors.dart';
import 'package:yumio/src/app/contants/assets_path/png_assets.dart';

class CustomerReviewsSection extends StatelessWidget {
  const CustomerReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Customer Reviews',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _buildRatingDistribution()),
              _buildAverageRating(),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _buildRatingDistribution() {
  return Column(
    children: [
      _buildRatingRow(5, 0.7),
      const SizedBox(height: 8),
      _buildRatingRow(4, 0.5),
      const SizedBox(height: 8),
      _buildRatingRow(3, 0.3),
      const SizedBox(height: 8),
      _buildRatingRow(2, 0.1),
      const SizedBox(height: 8),
      _buildRatingRow(1, 0.02),
    ],
  );
}

Widget _buildRatingRow(int stars, double percentage) {
  return Row(
    children: [
      SizedBox(
        width: 10,
        height: 18,
        child: Text(
          textAlign: TextAlign.center,
          "$stars",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: AppColors.textPrimary,
          ),
        ),
      ),
      const SizedBox(width: 4),
      Image.asset(PngAssets.commonStartSmallIcon, width: 16, height: 16),
      const SizedBox(width: 4),
      Expanded(
        child: LinearProgressIndicator(
          value: percentage,
          backgroundColor: AppColors.transparent,
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
          minHeight: 6,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    ],
  );
}

Widget _buildAverageRating() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Text(
        "4.8",
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
        ),
      ),
      const SizedBox(height: 8),
      Row(
        spacing: 8,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset(
            PngAssets.commonRatingStarIcon,
            width: 10,
            height: 10,
            color: AppColors.warning,
          ),
          Image.asset(
            PngAssets.commonRatingStarIcon,
            width: 10,
            height: 10,
            color: AppColors.warning,
          ),
          Image.asset(
            PngAssets.commonRatingStarIcon,
            width: 10,
            height: 10,
            color: AppColors.warning,
          ),
          Image.asset(
            PngAssets.commonRatingStarIcon,
            width: 10,
            height: 10,
            color: AppColors.warning,
          ),
          Image.asset(
            PngAssets.commonRatingStarIcon,
            width: 10,
            height: 10,
            color: Color(0xFFDDDDDD),
          ),
        ],
      ),
      const SizedBox(height: 8),
      Text(
        '10 Reviews',
        style: TextStyle(
          fontSize: 14,
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );
}
