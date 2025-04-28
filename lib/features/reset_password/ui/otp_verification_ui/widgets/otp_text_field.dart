import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/app_text_styles.dart';
import '../../../../../core/theming/colors_helper.dart';

class OtpTextField extends StatelessWidget {
  const OtpTextField({
    super.key,
    required this.textEditingController,
    required this.focusNode,
    this.onChanged,
  });
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.h,
      width: 48.w,
      child: TextFormField(
        onChanged: onChanged,
        maxLength: 1,
        focusNode: focusNode,
        controller: textEditingController,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLines: 1,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '';
          }
          return null;
        },
        decoration: InputDecoration(
          counterText: '',
          hintMaxLines: 1,
          contentPadding: EdgeInsets.only(top: 16.h, bottom: 16.h),
          focusColor: ColorsHelper.primaryColor,
          hintText: '-',
          hintStyle: AppTextStyles.robotoFadedBlackRegular16,
          fillColor: ColorsHelper.offWhite,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorsHelper.primaryColor,
              width: 1.3,
            ),
            borderRadius: BorderRadius.circular(8.r),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorsHelper.semiGray, width: 1.3),
            borderRadius: BorderRadius.circular(8.r),
          ),
          errorStyle: const TextStyle(fontSize: 0),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorsHelper.red, width: 1.3),
            borderRadius: BorderRadius.circular(8.r),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorsHelper.red, width: 1.3),
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
      ),
    );
  }
}
