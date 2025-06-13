import 'package:connect_chain_market/core/theming/app_text_styles.dart';
import 'package:connect_chain_market/core/theming/colors_helper.dart';
import 'package:connect_chain_market/features/categories/data/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;
  final VoidCallback onTap;

  const CategoryItem({super.key, required this.category, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 75.w,
        margin: EdgeInsets.only(right: 12.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Category circle with shadow
            Container(
              width: 65.r,
              height: 65.r,
              decoration: BoxDecoration(
                color: ColorsHelper.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: ColorsHelper.boxShadow.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child:
                    category.imageUrl != null
                        ? ClipRRect(
                          borderRadius: BorderRadius.circular(32.5.r),
                          child: Image.network(
                            category.imageUrl!,
                            width: 65.r,
                            height: 65.r,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                category.iconPath,
                                width: 32.r,
                                height: 32.r,
                              );
                            },
                          ),
                        )
                        : Image.asset(
                          category.iconPath,
                          width: 32.r,
                          height: 32.r,
                        ),
              ),
            ),
            SizedBox(height: 8.h),
            // Category name
            Text(
              category.name,
              style: AppTextStyles.rubikGrayRegular12.copyWith(
                color: ColorsHelper.black,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
