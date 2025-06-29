import 'package:flutter/material.dart';

import '../helpers/spacing.dart';
import '../theming/app_text_styles.dart';
import 'custom_text_form_field.dart';

class CustomTextFormFieldWithTitle extends StatelessWidget {
  const CustomTextFormFieldWithTitle({
    super.key,
    required this.title,
    required this.hintText,
    this.isRequired,
    this.maxlines,
    this.suffixIcon,
    this.keyboardType,
    required this.controller,
    required this.validator,
  });
  final String title;
  final String hintText;
  final bool? isRequired;
  final int? maxlines;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final dynamic Function(String?) validator;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isRequired != null ? '* $title' : title,
          style: AppTextStyles.robotoBlackSemiBold16,
        ),
        verticalSpace(10),
        CustomTextFormField(
          keyboardType: keyboardType,
          suffixIcon: suffixIcon,
          maxLines: maxlines ?? 1,
          hintText: hintText,
          controller: controller,
          validator: (value) => validator(value),
        ),
      ],
    );
  }
}
