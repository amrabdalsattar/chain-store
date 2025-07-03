part of '../ratings_reviews_screen.dart';

class ReviewsListWidget extends StatelessWidget {
  final List<ReviewModel> reviews;
  const ReviewsListWidget({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Reviews (${reviews.length})',
            style: TextStyle(
              fontFamily: 'Rubik',
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: ColorsHelper.black,
            ),
          ),
          verticalSpace(16),
          ...reviews.map((review) => ReviewItemWidget(review: review)).toList(),
        ],
      ),
    );
  }
}