import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/theming/colors_helper.dart';

class CategorySideBar extends StatelessWidget {
  final List categories;
  const CategorySideBar({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final sidebarWidth = screenWidth < 600 ? screenWidth * 0.3 : 180.w;
    return Container(
      width: sidebarWidth,
      decoration: BoxDecoration(
        color: ColorsHelper.white,
        boxShadow: [
          BoxShadow(
            color: ColorsHelper.boxShadow.withValues(alpha: 0.08),
            blurRadius: 4,
            offset: const Offset(2, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Categories title
          Padding(
            padding: EdgeInsets.only(left: 16.w, top: 20.h, bottom: 16.h),
            child: Text(
              'For you',
              style: AppTextStyles.robotoBlackRegular12.copyWith(
                fontSize: 16.sp,
              ),
            ),
          ),

          // Categories list
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(top: 8.h),
              itemBuilder: (context, index) {
                final category = categories[index];
                final isSelected = index == 0;
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: 12.h,
                      horizontal: 16.w,
                    ),
                    decoration: BoxDecoration(
                      color:
                          isSelected
                              ? ColorsHelper.primaryColor.withValues(alpha: 0.1)
                              : Colors.transparent,
                      border: Border(
                        left: BorderSide(
                          color:
                              isSelected
                                  ? ColorsHelper.primaryColor
                                  : Colors.transparent,
                          width: 3.w,
                        ),
                      ),
                    ),
                    child: Text(
                      category,
                      style: AppTextStyles.rubikGrayMedium12.copyWith(
                        color:
                            isSelected
                                ? ColorsHelper.primaryColor
                                : ColorsHelper.black,
                        fontWeight:
                            isSelected ? FontWeight.w500 : FontWeight.w400,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
