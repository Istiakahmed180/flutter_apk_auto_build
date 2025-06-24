import 'package:flutter/material.dart';
import 'package:yumio/src/app/contants/app_colors.dart';

class CommonLabelText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  final FontWeight fontWeight;
  final bool isRequired;

  const CommonLabelText({
    super.key,
    required this.text,
    this.fontSize = 12,
    this.color,
    this.fontWeight = FontWeight.w600,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: text,
        style: TextStyle(
          fontSize: fontSize,
          color: color ?? AppColors.grey,
          fontWeight: fontWeight,
        ),
        children:
            isRequired
                ? [
                  TextSpan(
                    text: ' *',
                    style: TextStyle(
                      color: AppColors.error,
                      fontSize: fontSize,
                      fontWeight: fontWeight,
                    ),
                  ),
                ]
                : [],
      ),
    );
  }
}
