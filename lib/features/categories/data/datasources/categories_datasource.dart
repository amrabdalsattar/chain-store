import '../../../../core/helpers/token_helper.dart';
import '../../../../core/networking/api_constants.dart';
import '../../../../core/networking/api_helper.dart';
import '../../../../core/networking/api_request_model.dart';
import '../../../home/data/models/products_response_model.dart';
import '../models/categories_response_model.dart';

class CategoriesDatasource {
  final ApiHelper _apiHelper;
  const CategoriesDatasource(this._apiHelper);

  Future<List<Category>> getCategories() async {
    final response = await _apiHelper.get(
      const ApiRequestModel(endPoint: ApiConstants.getCategoriesEP),
    );

    final CategoriesResponse categoriesResponse = CategoriesResponse.fromJson(
      response,
    );

    return categoriesResponse.data;
  }

  Future<List<ProductDataModel>> getProductsByCategory(int categoryId) async {
    final response = await _apiHelper.get(
      ApiRequestModel(
        endPoint: ApiConstants.getProductsByCategoryEP,
        queries: {'categoryId': categoryId},
        headers: {
          'Authorization': 'Bearer ${await TokenHelper.getSecuredUserToken()}',
        },
      ),
    );

    final ProductsResponseModel productsResponseModel =
        ProductsResponseModel.fromJson(response);

    return productsResponseModel.products;
  }
}
