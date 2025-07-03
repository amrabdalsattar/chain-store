part of '../ratings_reviews_screen.dart';

class WriteCommentModalButtonsSection extends StatelessWidget {
  const WriteCommentModalButtonsSection({
    super.key,
    required this.onSubmit,
    this.onCancell,
  });

  final void Function() onSubmit;
  final void Function()? onCancell;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              context.pop();
              onCancell?.call();
            },
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                color: ColorsHelper.secondaryGray.withOpacity(0.5),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              padding: EdgeInsets.symmetric(vertical: 16.h),
            ),
            child: Text(
              'Cancel',
              style: TextStyle(
                fontFamily: 'Rubik',
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                color: ColorsHelper.secondaryGray,
              ),
            ),
          ),
        ),
        horizontalSpace(16),
        Expanded(
          flex: 2,
          child: ElevatedButton(
            onPressed: onSubmit,
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorsHelper.primaryColor,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              padding: EdgeInsets.symmetric(vertical: 16.h),
            ),
            child: Text(
              'Submit Review',
              style: TextStyle(
                fontFamily: 'Rubik',
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
