part of 'rating_reviews_cubit.dart';

@freezed
class RatingReviewsState with _$RatingReviewsState {
  const factory RatingReviewsState.initial() = _Initial;

    // Reviews
  const factory RatingReviewsState.success(ProductDetailsResponse product) =
      addProductReviewSuccess;
  const factory RatingReviewsState.failed() = addProductReviewFailed;
    const factory RatingReviewsState.errorMessage() = addProductReviewErrorMessage;

  const factory RatingReviewsState.loading() =
      addProductReviewLoading;

}
