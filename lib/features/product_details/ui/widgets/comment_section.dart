part of '../product_details_screen.dart';

class CommentSection extends StatelessWidget {
  const CommentSection({super.key});

  @override
  Widget build(BuildContext context) {
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
                                'Tasneem Wael',
                                style: AppTextStyles.robotoBlackMedium15,
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '4.0',
                                  style: AppTextStyles.robotoBlackMedium15,
                                ),
                                horizontalSpace(4),
                                const RatingStars(rating: 4, size: 16),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    verticalSpace(8),
                    Text(
                      'I wasn’t expecting much, but wow—this T-shirt is next-level comfy! The fabric feels super soft on the skin, and the fit is just right—not too tight, not too loose.',
                      style: AppTextStyles.robotoFadedBlackRegular16.copyWith(
                        fontSize: 14.sp,
                      ),
                    ),
                    verticalSpace(8),
                    Row(
                      children: [
                        const Icon(
                          Icons.thumb_up_alt_outlined,
                          size: 22,
                          color: ColorsHelper.black,
                        ),
                        horizontalSpace(8),
                        const Icon(
                          Icons.thumb_down_alt_outlined,
                          size: 22,
                          color: ColorsHelper.black,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -25,
                left: -5,
                child: Container(
                  width: 50.w,
                  height: 50.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorsHelper.liteGray,
                  ),
                  child: ClipOval(
                    child: Image.network(
                      'https://cdn2.vectorstock.com/i/1000x1000/54/41/young-and-elegant-woman-avatar-profile-vector-9685441.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        verticalSpace(10),
        Container(
          padding: EdgeInsets.only(right: 20.w),
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              context.pushNamed(Routes.rattingScreenRoute);
            },
            child: Text(
              'See All Reviews',
              style: AppTextStyles.robotoBlackBold12.copyWith(
                color: ColorsHelper.fadedBlack,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
