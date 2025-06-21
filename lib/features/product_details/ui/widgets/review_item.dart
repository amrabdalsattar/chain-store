import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors_helper.dart';
import '../../../home/ui/sections/product/widgets/rating_stars.dart';

class ReviewItem extends StatelessWidget {
  final Map<String, dynamic> review;

  const ReviewItem({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 40.w,
              height: 40.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: ColorsHelper.homeScaffoldColor,
              ),
              child: Center(
                child: Text(
                  review['name'].substring(0, 1),
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorsHelper.primaryColor,
                  ),
                ),
              ),
            ),
            horizontalSpace(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    review['name'],
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: ColorsHelper.black,
                    ),
                  ),
                  verticalSpace(4),
                  Row(
                    children: [
                      RatingStars(rating: review['rating']),
                      horizontalSpace(8),
                      Text(
                        review['date'],
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: ColorsHelper.secondaryGray,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        verticalSpace(12),
        Text(
          review['comment'],
          style: TextStyle(
            fontFamily: 'Rubik',
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: ColorsHelper.liteBlue,
            height: 1.5,
          ),
        ),
        if ((review['images'] as List).isNotEmpty) ...[
          verticalSpace(12),
          SizedBox(
            height: 80.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: (review['images'] as List).length,
              itemBuilder: (context, index) {
                return Container(
                  width: 80.w,
                  height: 80.h,
                  margin: EdgeInsets.only(right: 8.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: ColorsHelper.homeScaffoldColor,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Image.asset(
                      review['images'][index],
                      fit: BoxFit.cover,
                      errorBuilder:
                          (context, error, stackTrace) => Icon(
                            Icons.image_not_supported_outlined,
                            size: 30.w,
                            color: Colors.grey,
                          ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
        verticalSpace(16),
        const Divider(height: 1, thickness: 1, color: ColorsHelper.liteGray),
        verticalSpace(16),
      ],
    );
  }
}
