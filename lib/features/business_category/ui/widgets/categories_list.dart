import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../logic/cubit/business_category_cubit.dart';
import 'custom_category_chip.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key, required this.businessCategoryCubit});

  final BusinessCategoryCubit businessCategoryCubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusinessCategoryCubit, BusinessCategoryState>(
      builder: (context, state) {
        return Wrap(
          spacing: 12.w,
          runSpacing: 12.h,
          children: List.generate(businessCategoryCubit.categories.length, (
            index,
          ) {
            final category = businessCategoryCubit.categories[index];
            return CustomCategoryChip(
              iconPath: category.iconPath,
              title: category.name,
            );
          }),
        );
      },
    );
  }
}
