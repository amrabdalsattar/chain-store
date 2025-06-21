import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/colors_helper.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_button.dart';
import '../../home/ui/sections/product/widgets/rating_stars.dart';
import 'widgets/review_item.dart';

class RatingsReviewsScreen extends StatelessWidget {
  const RatingsReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsHelper.homeScaffoldColor,
      appBar: const CustomAppBar(
        title: 'Ratings & Reviews',
        isLeadedByLogo: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(16),
              _buildRatingSummary(),
              verticalSpace(24),
              _buildReviewsList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRatingSummary() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Rating Summary',
            style: TextStyle(
              fontFamily: 'Rubik',
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: ColorsHelper.black,
            ),
          ),
          verticalSpace(16),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '4.8',
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 48.sp,
                          fontWeight: FontWeight.w700,
                          color: ColorsHelper.black,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.h, left: 4.w),
                        child: Text(
                          '/5',
                          style: TextStyle(
                            fontFamily: 'Rubik',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: ColorsHelper.secondaryGray,
                          ),
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(4),
                  Row(
                    children: [
                      const RatingStars(
                        rating: 5,
                        size: 14,
                        showEmptyStars: false,
                      ),
                      horizontalSpace(8),
                      Text(
                        'Based on 124 reviews',
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: ColorsHelper.secondaryGray,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              horizontalSpace(24),
              Expanded(
                child: Column(
                  children: [
                    _buildRatingBar(5, 0.75),
                    verticalSpace(8),
                    _buildRatingBar(4, 0.15),
                    verticalSpace(8),
                    _buildRatingBar(3, 0.05),
                    verticalSpace(8),
                    _buildRatingBar(2, 0.03),
                    verticalSpace(8),
                    _buildRatingBar(1, 0.02),
                  ],
                ),
              ),
            ],
          ),
          verticalSpace(16),
          CustomButton(
            title: 'Write a Review',
            width: double.infinity,
            onTap: () {
              // Navigate to write review screen
            },
          ),
        ],
      ),
    );
  }

  Widget _buildRatingBar(int rating, double percentage) {
    return Row(
      children: [
        Text(
          '$rating',
          style: TextStyle(
            fontFamily: 'Rubik',
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: ColorsHelper.secondaryGray,
          ),
        ),
        horizontalSpace(8),
        const RatingStars(rating: 1, size: 16, showEmptyStars: false),
        horizontalSpace(8),
        Expanded(
          child: Stack(
            children: [
              Container(
                height: 8.h,
                decoration: BoxDecoration(
                  color: ColorsHelper.liteGray,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
              FractionallySizedBox(
                widthFactor: percentage,
                child: Container(
                  height: 8.h,
                  decoration: BoxDecoration(
                    color: ColorsHelper.primaryColor,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
              ),
            ],
          ),
        ),
        horizontalSpace(8),
        Text(
          '${(percentage * 100).toInt()}%',
          style: TextStyle(
            fontFamily: 'Rubik',
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: ColorsHelper.secondaryGray,
          ),
        ),
      ],
    );
  }

  Widget _buildReviewsList() {
    // Sample review data
    final List<Map<String, dynamic>> reviews = [
      {
        'name': 'John Smith',
        'avatar': 'assets/images/avatar1.png',
        'rating': 5,
        'date': 'March 15, 2023',
        'comment':
            'The quality of this product exceeded my expectations. The fabric is soft yet durable, and the fit is perfect. Highly recommend!',
        'images': ['assets/images/review1.png', 'assets/images/review2.png'],
      },
      {
        'name': 'Sarah Johnson',
        'avatar': 'assets/images/avatar2.png',
        'rating': 4,
        'date': 'February 28, 2023',
        'comment':
            'Great product overall. The color is slightly different from what I expected, but the quality is excellent.',
        'images': [],
      },
      {
        'name': 'Michael Brown',
        'avatar': 'assets/images/avatar3.png',
        'rating': 5,
        'date': 'January 10, 2023',
        'comment':
            'Perfect fit and very comfortable. I\'ve been wearing it regularly for a month now and it still looks brand new.',
        'images': ['assets/images/review3.png'],
      },
    ];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Reviews (124)',
            style: TextStyle(
              fontFamily: 'Rubik',
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: ColorsHelper.black,
            ),
          ),
          verticalSpace(16),
          ...reviews.map((review) => _buildReviewItem(review)).toList(),
        ],
      ),
    );
  }

  Widget _buildReviewItem(Map<String, dynamic> review) {
    return ReviewItem(review: review);
  }
}
