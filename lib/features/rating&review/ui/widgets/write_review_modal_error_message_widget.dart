part of '../ratings_reviews_screen.dart';

class WriteReviewModalErrorMessageWidget extends StatelessWidget {
  const WriteReviewModalErrorMessageWidget({super.key, required this.cubit});
  final RatingReviewsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RatingReviewsCubit, RatingReviewsState>(
      buildWhen: (previous, current) => current is addProductReviewErrorMessage,
      builder: (_, state) {
        if (cubit.errorMessage.isNotEmpty) {
          return Column(
            children: [
              verticalSpace(16),
              _buildErrorMessage(cubit.errorMessage),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildErrorMessage(String errorMessage) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.red.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(Icons.error_outline_rounded, color: Colors.red, size: 20.sp),
          horizontalSpace(8),
          Expanded(
            child: Text(
              errorMessage,
              style: TextStyle(
                fontSize: 14.sp,
                fontFamily: 'Rubik',
                color: Colors.red,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
