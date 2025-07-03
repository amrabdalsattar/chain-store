part of '../product_details_screen.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key, required this.product});
  final ProductDetailsResponse product;

  @override
  Widget build(BuildContext context) {
    final reviews = product.reviews;
    if (reviews == null || reviews.isEmpty) {
      return SeeAllReviewButton(product: product);
    }
    final review = reviews.first;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 336.w,
                padding: EdgeInsets.only(
                  left: 48.w,
                  right: 16.w,
                  top: 16.h,
                  bottom: 12.h,
                ),
                decoration: BoxDecoration(
                  color: ColorsHelper.white,
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                review.customerName,
                                style: AppTextStyles.robotoBlackMedium15,
                              ),
                            ],
                          ),
                        ),
                        RatingStars(rating: review.rate, size: 16),
                      ],
                    ),
                    verticalSpace(8),
                    Text(
                      review.review,
                      style: AppTextStyles.robotoFadedBlackRegular16.copyWith(
                        fontSize: 14.sp,
                      ),
                    ),
                    verticalSpace(8),
                  ],
                ),
              ),
              Positioned(
                top: -15,
                left: -0,
                child: Container(
                  width: 45.w,
                  height: 45.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorsHelper.liteGray,
                  ),
                  child: ClipOval(
                    child: CustomImageWidget(
                      imageUrl: review.customerImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        verticalSpace(10),
        SeeAllReviewButton(product: product),
      ],
    );
  }
}