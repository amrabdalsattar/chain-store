part of '../ratings_reviews_screen.dart';


class WriteCommentModalHeader extends StatelessWidget {
  const WriteCommentModalHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(24.w, 24.h, 16.w, 20.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: ColorsHelper.secondaryGray.withOpacity(0.1),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: ColorsHelper.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Icon(
              Icons.rate_review_rounded,
              color: ColorsHelper.primaryColor,
              size: 24.sp,
            ),
          ),
          horizontalSpace(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Write a Review',
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700,
                    color: ColorsHelper.black,
                  ),
                ),
                Text(
                  'Share your experience with others',
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
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.close_rounded,
              color: ColorsHelper.secondaryGray,
              size: 24.sp,
            ),
            padding: EdgeInsets.all(8.w),
          ),
        ],
      ),
    );
  }
}