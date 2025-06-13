import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/widgets/custom_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_helper.dart';

class SlidableCartItem extends StatelessWidget {
  final Map<String, dynamic> item;
  final VoidCallback onDelete;

  const SlidableCartItem({
    super.key,
    required this.item,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Slidable(
        key: ValueKey(item['id']),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          dismissible: DismissiblePane(onDismissed: onDelete),
          children: [
            SlidableAction(
              onPressed: (_) => onDelete(),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
              borderRadius: BorderRadius.circular(8.r),
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Product image
              Container(
                width: 100.w,
                height: 100.w,
                margin: EdgeInsets.only(right: 12.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: ColorsHelper.homeScaffoldColor,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: const CustomImageWidget(
                    fit: BoxFit.fill,
                    imageUrl:
                        'https://th.bing.com/th/id/OIP.bO4pS4CxtlOHb0LsEMiIWwHaIf?cb=iwp2&rs=1&pid=ImgDetMain',
                  ),
                ),
              ),
              // Product details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product title
                    Text(
                      item['title'],
                      style: AppTextStyles.robotoBlackRegular14,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    // Product subtitle
                    Padding(
                      padding: EdgeInsets.all(10.r),
                      child: Text(
                        'subtitle',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: AppTextStyles.robotoFadedBlackRegular16.copyWith(
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                    // Product price
                    Text(
                      item['price'] + ' EGP',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: AppTextStyles.robotoBlackBold12.copyWith(
                        fontSize: 16.sp,
                      ),
                    ),
                    verticalSpace(6),
                    // Minimum order quantity
                    Text(
                      'min.order : 50 pcs ',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: AppTextStyles.robotoFadedBlackRegular16.copyWith(
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
              // Quantity controls
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8.w),
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.r),
                      color: ColorsHelper.liteGray,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.remove,
                          size: 16.w,
                          color: ColorsHelper.black,
                        ),
                        horizontalSpace(8),
                        Text(
                          '${item['quantity']}',
                          style: AppTextStyles.robotoBlackRegular14,
                        ),
                        horizontalSpace(8),

                        Icon(Icons.add, size: 16.w, color: ColorsHelper.black),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
