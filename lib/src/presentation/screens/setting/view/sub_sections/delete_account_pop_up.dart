import 'package:flutter/material.dart';
import 'package:yumio/src/app/contants/app_colors.dart';
import 'package:yumio/src/app/contants/assets_path/png_assets.dart';
import 'package:yumio/src/common/widgets/button/common_elevated_button.dart';
import 'package:yumio/src/common/widgets/button/common_outlined_button.dart';

class DeleteAccountPopUp extends StatelessWidget {
  const DeleteAccountPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      // canPop: false,
      child: Dialog(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.error.withValues(alpha: 0.5),
                      blurRadius: 30,
                    ),
                  ],
                ),
                child: Image.asset(
                  PngAssets.commonDeleteIcon,
                  width: 30,
                  height: 30,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                textAlign: TextAlign.center,
                "Delete Your Account?",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                textAlign: TextAlign.center,
                "You want to delete this account?",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: AppColors.textTertiary,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonOutlinedButton(
                    width: 88,
                    height: 36,
                    borderColor: AppColors.error.withValues(alpha: 0.32),
                    fontSize: 12,
                    buttonName: "Cancel",
                    onPressed: () {},
                  ),
                  const SizedBox(width: 14),
                  CommonElevatedButton(
                    width: 88,
                    height: 36,
                    fontSize: 12,
                    buttonName: "Confirm",
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
