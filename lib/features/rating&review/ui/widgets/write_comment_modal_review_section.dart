part of '../ratings_reviews_screen.dart';

class WriteCommentModalReviewSection extends StatelessWidget {
  const WriteCommentModalReviewSection({super.key, required this.cubit});
  final RatingReviewsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Write your review',
          style: TextStyle(
            fontFamily: 'Rubik',
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: ColorsHelper.black,
          ),
        ),
        verticalSpace(12),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color:
                  cubit.reviewFocus.hasFocus
                      ? ColorsHelper.primaryColor
                      : ColorsHelper.secondaryGray.withOpacity(0.3),
              width: cubit.reviewFocus.hasFocus ? 2 : 1,
            ),
          ),
          child: TextField(
            controller: cubit.reviewController,
            focusNode: cubit.reviewFocus,
            maxLines: 6,
            minLines: 4,
            maxLength: 500,
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: 'Rubik',
              color: ColorsHelper.black,
            ),
            decoration: InputDecoration(
              hintText: 'Share your thoughts about this product...',
              hintStyle: TextStyle(
                color: ColorsHelper.secondaryGray,
                fontSize: 16.sp,
              ),
              filled: true,
              fillColor: Colors.transparent,
              contentPadding: EdgeInsets.all(16.w),
              border: InputBorder.none,
              counterStyle: TextStyle(
                fontSize: 12.sp,
                color: ColorsHelper.secondaryGray,
              ),
            ),
            onChanged: (value) {},
          ),
        ),
      ],
    );
  }
}
