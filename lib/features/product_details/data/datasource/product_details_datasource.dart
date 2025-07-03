import '../../../../core/networking/api_constants.dart';
import '../../../../core/networking/api_helper.dart';
import '../../../../core/networking/api_request_model.dart';
import '../models/product_details_response.dart';

class ProductDetailsDatasource {
  final ApiHelper _apiHelper;
  const ProductDetailsDatasource(this._apiHelper);

  Future<ProductDetailsResponse> getProductDetails(int prodcutId) async {
    final response = await _apiHelper.get(
      ApiRequestModel(
        endPoint: ApiConstants.getProductDetailsEP,
        queries: {'productId': '$prodcutId'},
      ),
    );

    return ProductDetailsResponse.fromJson(response);
  }


}
