import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumio/src/app/contants/app_colors.dart';
import 'package:yumio/src/app/contants/assets_path/png_assets.dart';
import 'package:yumio/src/presentation/screens/home/view/sub_sections/search_filter_section.dart';

class SearchRecipesSection extends StatelessWidget {
  const SearchRecipesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: TextFormField(
        readOnly: true,
        onTap: () {
          Get.bottomSheet(
            exitBottomSheetDuration: Duration(milliseconds: 300),
            enterBottomSheetDuration: Duration(milliseconds: 300),
            isScrollControlled: true,
            SearchFilterSection(),
            backgroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
            ),
          );
        },
        style: TextStyle(
          color: AppColors.textTertiary,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        cursorColor: AppColors.primary,
        cursorHeight: 18,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.white,
          hintText: "Search recipes",
          hintStyle: TextStyle(
            color: AppColors.grey2,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
          contentPadding: EdgeInsets.all(16),
          isDense: false,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Color(0xFFEDF1F3)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Color(0xFFEDF1F3)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Color(0xFFEDF1F3)),
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 10),
            child: Image.asset(
              PngAssets.commonSearchIcon,
              width: 20,
              height: 20,
            ),
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: 10),
            child: Image.asset(
              PngAssets.commonFilterIcon,
              width: 20,
              height: 20,
            ),
          ),
          prefixIconConstraints: BoxConstraints(minWidth: 45, minHeight: 20),
          suffixIconConstraints: BoxConstraints(minWidth: 45, minHeight: 20),
        ),
      ),
    );
  }
}
