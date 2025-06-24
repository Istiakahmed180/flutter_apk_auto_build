import 'package:flutter/material.dart';
import 'package:yumio/src/app/contants/app_colors.dart';

class CommonElevatedButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final Color backgroundColor;
  final double borderRadius;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;

  const CommonElevatedButton({
    super.key,
    required this.buttonName,
    required this.onPressed,
    this.width = double.infinity,
    this.height = 52,
    this.backgroundColor = AppColors.primary,
    this.borderRadius = 8,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w600,
    this.textColor = AppColors.white,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          backgroundColor: backgroundColor,
        ),
        child: _buildButtonContent(context),
      ),
    );
  }

  Widget _buildButtonContent(context) {
    return Text(
      buttonName,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: textColor,
      ),
    );
  }
}
