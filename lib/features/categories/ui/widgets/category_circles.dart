import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routes.dart';
import 'category_item.dart';

class CategoryCircles extends StatelessWidget {
  final List categories;
  const CategoryCircles({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      margin: EdgeInsets.only(bottom: 8.h),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        padding: EdgeInsets.zero,
        itemExtent: 100.w,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: CategoryItem(
              category: category,
              onTap: () {
                // Navigate to category details
                Navigator.pushNamed(
                  context,
                  Routes.productDetailsRoute,
                  arguments: category,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
