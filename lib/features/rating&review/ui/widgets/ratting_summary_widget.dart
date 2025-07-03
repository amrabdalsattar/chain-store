part of '../ratings_reviews_screen.dart';

class RatingSummaryWidget extends StatelessWidget {
  final double averageRating;
  final int totalReviews;
  final VoidCallback? onReviewAdded;
  final String? productId;
  final RatingReviewsCubit cubit;

  const RatingSummaryWidget({
    super.key,
    required this.averageRating,
    required this.totalReviews,
    this.onReviewAdded,
    this.productId,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return _RatingSummaryContainer(
      header: _RatingSummaryHeader(),
      ratingDisplay: _RatingDisplay(
        averageRating: averageRating,
        totalReviews: totalReviews,
      ),
      writeReviewButton: CustomButton(
        title: 'Write a Review',
        width: double.infinity,
        onTap: () => _showWriteReviewModal(context),
      ),
    );
  }

  void _showWriteReviewModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      isDismissible: true,
      enableDrag: true,
      builder:
          (_) => BlocProvider.value(
            value: cubit,
            child: WriteReviewModal(
              productId: productId,
              onReviewSubmitted: onReviewAdded,
              cubit: cubit,
            ),
          ),
    ).then((value) {
      cubit.clearAll();
    });
  }
}

class _RatingSummaryContainer extends StatelessWidget {
  final Widget header;
  final Widget ratingDisplay;
  final Widget writeReviewButton;

  const _RatingSummaryContainer({
    required this.header,
    required this.ratingDisplay,
    required this.writeReviewButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header,
          verticalSpace(20),
          ratingDisplay,
          verticalSpace(24),
          writeReviewButton,
        ],
      ),
    );
  }
}

class _RatingSummaryHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: ColorsHelper.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Icon(
            Icons.star_rounded,
            color: ColorsHelper.primaryColor,
            size: 20.sp,
          ),
        ),
        horizontalSpace(12),
        Text(
          'Customer Reviews',
          style: TextStyle(
            fontFamily: 'Rubik',
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: ColorsHelper.black,
          ),
        ),
      ],
    );
  }
}

class _RatingDisplay extends StatelessWidget {
  final double averageRating;
  final int totalReviews;

  const _RatingDisplay({
    required this.averageRating,
    required this.totalReviews,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: _RatingDetails(
            averageRating: averageRating,
            totalReviews: totalReviews,
          ),
        ),
        horizontalSpace(16),
        Expanded(flex: 1, child: _RatingBars(totalReviews: totalReviews)),
      ],
    );
  }
}

class _RatingDetails extends StatelessWidget {
  final double averageRating;
  final int totalReviews;

  const _RatingDetails({
    required this.averageRating,
    required this.totalReviews,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              averageRating.toStringAsFixed(1),
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 56.sp,
                fontWeight: FontWeight.w800,
                color: ColorsHelper.black,
                height: 1.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 12.h, left: 6.w),
              child: Text(
                '/5',
                style: TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: ColorsHelper.secondaryGray,
                ),
              ),
            ),
          ],
        ),
        verticalSpace(8),
        RatingStars(rating: averageRating, size: 16, showEmptyStars: true),
        verticalSpace(6),
        Text(
          _getReviewText(),
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

  String _getReviewText() {
    if (totalReviews == 0) return 'No reviews yet';
    if (totalReviews == 1) return 'Based on 1 review';
    return 'Based on $totalReviews reviews';
  }
}

class _RatingBars extends StatelessWidget {
  final int totalReviews;
  const _RatingBars({required this.totalReviews});

  @override
  Widget build(BuildContext context) {
    final ratingDistribution = [
      {'stars': 5, 'count': (totalReviews * 0.6).round()},
      {'stars': 4, 'count': (totalReviews * 0.25).round()},
      {'stars': 3, 'count': (totalReviews * 0.1).round()},
      {'stars': 2, 'count': (totalReviews * 0.03).round()},
      {'stars': 1, 'count': (totalReviews * 0.02).round()},
    ];
    return Column(
      children:
          ratingDistribution.map((rating) {
            final percentage =
                totalReviews > 0 ? rating['count']! / totalReviews : 0.0;
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 2.h),
              child: Row(
                children: [
                  Text(
                    '${rating['stars']}',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: ColorsHelper.secondaryGray,
                    ),
                  ),
                  horizontalSpace(4),
                  Icon(Icons.star, size: 12.sp, color: Colors.amber),
                  horizontalSpace(8),
                  Expanded(
                    child: Container(
                      height: 6.h,
                      decoration: BoxDecoration(
                        color: ColorsHelper.secondaryGray.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(3.r),
                      ),
                      child: FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: percentage,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(3.r),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
    );
  }
}
