import 'package:flutter/material.dart';

import '../../../../core/helpers/app_images.dart';
import '../../../../core/theming/colors_helper.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class CustomSearchTextFormField extends StatelessWidget {
  final Function(String)? onChanged;
  const CustomSearchTextFormField({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      onChanged: onChanged,
      filled: false,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32),
        borderSide: const BorderSide(color: ColorsHelper.primaryColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32),
        borderSide: const BorderSide(color: ColorsHelper.liteGray),
      ),
      prefixIconPath: AppImages.searchBarIcon,
      hintText: 'Search',
      controller: TextEditingController(),
      validator: (value) {},
    );
  }
}
