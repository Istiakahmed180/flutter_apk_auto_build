import 'package:flutter/material.dart';
import 'package:yumio/src/app/contants/app_colors.dart';
import 'package:yumio/src/common/widgets/common_label_text.dart';

class CommonLabelAndDynamicField extends StatelessWidget {
  final String labelText;
  final double labelFontSize;
  final Color? labelColor;
  final FontWeight labelFontWeight;
  final bool isLabelRequired;
  final Widget dynamicField;

  const CommonLabelAndDynamicField({
    super.key,
    required this.labelText,
    this.labelFontSize = 12,
    this.labelColor,
    this.labelFontWeight = FontWeight.w600,
    this.isLabelRequired = false,
    required this.dynamicField,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonLabelText(
          text: labelText,
          fontSize: labelFontSize,
          color: labelColor ?? AppColors.grey,
          fontWeight: labelFontWeight,
          isRequired: isLabelRequired,
        ),
        const SizedBox(height: 5),
        dynamicField,
      ],
    );
  }
}
