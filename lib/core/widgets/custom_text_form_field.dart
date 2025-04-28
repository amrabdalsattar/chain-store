import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theming/app_text_styles.dart';
import '../theming/colors_helper.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final Widget? suffix;

  final String? prefixIconPath;
  final bool? isObscure;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final Function(String?) validator;
  final int maxLines;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final Color? fillColor;
  final bool? filled;
  final bool? isReadOnly;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.isObscure,
    this.keyboardType = TextInputType.text,
    required this.controller,
    required this.validator,
    this.prefixIconPath,
    this.maxLines = 1,
    this.enabledBorder,
    this.fillColor,
    this.filled,
    this.focusedBorder,
    this.suffix,
    this.isReadOnly,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: isReadOnly ?? false,
      canRequestFocus: isReadOnly != null ? !isReadOnly! : true,
      controller: controller,
      maxLines: maxLines,
      textCapitalization: keyboardType == TextInputType.name
          ? TextCapitalization.words
          : TextCapitalization.none,
      keyboardType: keyboardType,
      validator: (value) => validator(value),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: maxLines > 1 ? 16.h : 14.h,
          horizontal: 12.w,
        ),
        prefixIcon: prefixIconPath != null
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: SvgPicture.asset(
                  prefixIconPath!,
                  fit: BoxFit.scaleDown,
                ),
              )
            : null,
        focusColor: ColorsHelper.primaryColor,
        hintText: hintText,
        suffixIcon: suffixIcon,
        hintStyle: AppTextStyles.tajawalGrayRegular15.copyWith(height: 1.8),
        fillColor: fillColor ?? ColorsHelper.offWhite,
        filled: filled ?? true,
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsHelper.primaryColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(8.r),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsHelper.borderGray,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(8.r),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorsHelper.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorsHelper.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(
            color: ColorsHelper.borderGray,
            width: 1.3,
          ),
        ),
      ),
      obscureText: isObscure ?? false,
      style: AppTextStyles.tajawalDarkGrayMedium14,
      cursorColor: ColorsHelper.primaryColor,
    );
  }
}
