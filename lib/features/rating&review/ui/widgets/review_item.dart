part of '../ratings_reviews_screen.dart';

class ReviewItemWidget extends StatelessWidget {
  final ReviewModel review;
  const ReviewItemWidget({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(review.customerImage),
            radius: 24.w,
          ),
          horizontalSpace(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      review.customerName,
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: ColorsHelper.black,
                      ),
                    ),
                    horizontalSpace(8),
                    RatingStars(rating: review.rate, size: 14),
                  ],
                ),
                verticalSpace(4),
                Text(
                  review.review,
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: ColorsHelper.secondaryGray,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
