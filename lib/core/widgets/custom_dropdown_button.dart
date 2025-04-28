import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/app_text_styles.dart';
import '../theming/colors_helper.dart';

class CustomDropdownButton extends StatelessWidget {
  final String? value;
  final List<DropdownMenuItem<String>> items;
  final ValueChanged<String?>? onChanged;
  final String hintText;
  final Function(String?) validator;

  const CustomDropdownButton({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.hintText,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      validator: (value) => validator(value),
      value: value,
      items: items,
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorsHelper.offWhite,
        contentPadding: EdgeInsets.symmetric(
          vertical: 14.h,
          horizontal: 16.w,
        ),
        hintText: hintText,
        hintStyle: AppTextStyles.tajawalGrayRegular15.copyWith(height: 1.8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: ColorsHelper.borderGray,
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: ColorsHelper.borderGray,
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: ColorsHelper.primaryColor,
            width: 1.5,
          ),
        ),
      ),
      style: AppTextStyles.tajawalDarkGrayMedium14,
      icon: const Icon(
        Icons.arrow_drop_down,
        color: ColorsHelper.gray,
      ),
    );
  }
}
