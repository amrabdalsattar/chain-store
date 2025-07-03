import '../../../../core/helpers/token_helper.dart';
import '../../../../core/networking/api_constants.dart';
import '../../../../core/networking/api_helper.dart';
import '../../../../core/networking/api_request_model.dart';
import '../models/review_model.dart';

class RatingReviewDatasource {
  final ApiHelper _apiHelper;

  RatingReviewDatasource(this._apiHelper);

  Future<void> addProductReivew(ReviewModel review) async {
    await _apiHelper.post(
      ApiRequestModel(
        endPoint: ApiConstants.addReview,
        body: review.toJson(),
        headers: {
          'Authorization': 'Bearer ${await TokenHelper.getSecuredUserToken()}',
        },
      ),
    );
  }
}
