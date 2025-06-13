import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/theming/colors_helper.dart';
import '../../logic/cubit/business_category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCategoryChip extends StatelessWidget {
  final String iconPath;
  final String title;

  const CustomCategoryChip({
    super.key,
    required this.iconPath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BusinessCategoryCubit>();

    return BlocBuilder<BusinessCategoryCubit, BusinessCategoryState>(
      builder: (context, state) {
        final isSelected = cubit.isCategorySelected(title);

        return InkWell(
          onTap: () {
            cubit.toggleCategorySelection(title);
          },
          child: AnimatedContainer(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 9.5.h),
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              color: isSelected ? ColorsHelper.primaryColor : null,
              borderRadius: BorderRadius.circular(40.r),
              border: Border.all(width: 1.r, color: ColorsHelper.borderGray),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(iconPath, width: 24.w, height: 24.h),
                horizontalSpace(8),
                Text(
                  title,
                  style:
                      isSelected
                          ? AppTextStyles.robotoBlackRegular12.copyWith(
                            color: ColorsHelper.white,
                          )
                          : AppTextStyles.robotoBlackRegular12,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
