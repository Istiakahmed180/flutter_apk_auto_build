import 'package:flutter/material.dart';
import 'package:yumio/src/app/contants/app_colors.dart';

class CommonOutlinedButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final double borderRadius;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;
  final Color? borderColor;

  const CommonOutlinedButton({
    super.key,
    required this.buttonName,
    required this.onPressed,
    this.width = double.infinity,
    this.height = 52,
    this.borderRadius = 8,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w600,
    this.textColor = AppColors.textPrimary,
    this.borderColor = AppColors.inputBorder,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: borderColor!),
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
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
