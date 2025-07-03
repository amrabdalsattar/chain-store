import '../../../../core/networking/api_error_handler/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../datasource/rating_review_datasource.dart';
import '../models/review_model.dart';

class RatingReviewRepo {
  final RatingReviewDatasource _ratingReviewDatasource;

  RatingReviewRepo(this._ratingReviewDatasource);


Future<ApiResult<String>> addProductReivew(ReviewModel review) async {
    try {
      await _ratingReviewDatasource.addProductReivew(review);

      return const ApiResult.success('Success');
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }


}
