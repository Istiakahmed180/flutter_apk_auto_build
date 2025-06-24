import 'package:flutter/material.dart';
import 'package:yumio/src/app/contants/app_colors.dart';

class DividerSection extends StatelessWidget {
  const DividerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: AppColors.divider,
      thickness: 1,
      height: 0,
      indent: 0,
      endIndent: 0,
    );
  }
}
