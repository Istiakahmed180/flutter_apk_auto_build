import 'package:flutter/material.dart';
import 'package:yumio/src/app/contants/app_colors.dart';

class CommonTextInputField extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final Color? backgroundColor;
  final double? borderRadius;
  final void Function(String)? onChanged;
  final VoidCallback? onTap;
  final bool? showSuffixIcon;
  final Widget? suffixIcon;
  final Color? borderColor;
  final int? maxLines;
  final double? minHeight;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? contentPadding;

  const CommonTextInputField({
    super.key,
    this.hintText,
    this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.backgroundColor,
    this.borderRadius,
    this.onChanged,
    this.onTap,
    this.showSuffixIcon = false,
    this.suffixIcon,
    this.borderColor,
    this.maxLines,
    this.minHeight,
    this.textInputAction,
    this.focusNode,
    this.contentPadding,
  });

  @override
  State<CommonTextInputField> createState() => CommonTextInputFieldState();
}

class CommonTextInputFieldState extends State<CommonTextInputField> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight:
            widget.minHeight ??
            (widget.maxLines == null || widget.maxLines == 1 ? 46 : 0),
      ),
      child: TextFormField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        obscureText: widget.obscureText,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        onTap: widget.onTap,
        style: TextStyle(
          color: AppColors.textTertiary,
          fontWeight: FontWeight.w500,
          fontSize: 13,
        ),
        cursorColor: AppColors.primary,
        cursorHeight: 18,
        maxLines: widget.maxLines ?? 1,
        decoration: InputDecoration(
          filled: true,
          fillColor: widget.backgroundColor ?? AppColors.transparent,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: AppColors.grey2,
            fontWeight: FontWeight.w400,
            fontSize: 13,
          ),
          isDense: widget.maxLines == null || widget.maxLines == 1,
          contentPadding:
              widget.contentPadding ??
              EdgeInsets.symmetric(
                horizontal: 14,
                vertical:
                    widget.maxLines == null || widget.maxLines == 1 ? 12.5 : 16,
              ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
            borderSide: BorderSide(
              color: widget.borderColor ?? AppColors.inputBorder,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
            borderSide: BorderSide(
              color: widget.borderColor ?? AppColors.inputBorder,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
            borderSide: BorderSide(
              color: widget.borderColor ?? AppColors.inputBorder,
            ),
          ),
          suffixIcon:
              widget.showSuffixIcon!
                  ? widget.suffixIcon ?? const SizedBox()
                  : null,
          suffixIconConstraints: const BoxConstraints(maxHeight: 35),
        ),
        onChanged: widget.onChanged,
      ),
    );
  }
}
