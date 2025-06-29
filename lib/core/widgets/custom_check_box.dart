import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/spacing.dart';
import '../theming/app_text_styles.dart';
import '../theming/colors_helper.dart';

class CustomCheckboxRow extends StatefulWidget {
  const CustomCheckboxRow({
    super.key,
    required this.checkboxText,
    required this.isSelected,
  });
  final String checkboxText;
  final ValueChanged<bool> isSelected;

  @override
  State<CustomCheckboxRow> createState() => _CustomCheckboxRowState();
}

class _CustomCheckboxRowState extends State<CustomCheckboxRow> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Checkbox(
          splashRadius: 18,
          value: isSelected,
          onChanged: (value) {
            isSelected = !isSelected;
            setState(() {});
            widget.isSelected(isSelected);
          },
          activeColor: ColorsHelper.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
        horizontalSpace(8),
        Expanded(
          child: Text(
            widget.checkboxText,
            style: AppTextStyles.robotoGrayRegular10.copyWith(fontSize: 13.sp),
          ),
        ),
      ],
    );
  }
}
