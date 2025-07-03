part of '../ratings_reviews_screen.dart';

class WriteReviewModal extends StatelessWidget {
  final String? productId;
  final VoidCallback? onReviewSubmitted;
  final RatingReviewsCubit cubit;

  const WriteReviewModal({
    super.key,
    this.productId,
    this.onReviewSubmitted,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.85,
        ),
        margin: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
          top: 60.h,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16.h,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 30,
              offset: const Offset(0, 10),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const WriteCommentModalHeader(),
            Flexible(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WriteCommentModalRatingSection(
                      onChange: (ratting) {
                        cubit.setRating(ratting);
                      },
                    ),
                    verticalSpace(24),
                    WriteCommentModalReviewSection(cubit: cubit),
                    WriteReviewModalErrorMessageWidget(cubit: cubit),
                    verticalSpace(32),
                    WriteCommentModalButtonsSection(
                      onCancell: () {
                        cubit.clearAll();
                      },
                      onSubmit: () async {
                        // Submit Logic from cubit
                        await cubit.addReview();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
