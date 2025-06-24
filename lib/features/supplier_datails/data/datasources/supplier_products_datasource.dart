import '../../../../core/networking/api_constants.dart';
import '../../../../core/networking/api_helper.dart';
import '../../../../core/networking/api_request_model.dart';
import '../models/supplier_products_response.dart';

class SupplierProductsDatasource {
  final ApiHelper _apiHelper;
  SupplierProductsDatasource(this._apiHelper);

  Future<List<SupplierProductModel>> getSupplierProducts(
    String supplierId,
  ) async {
    final response = await _apiHelper.get(
      ApiRequestModel(
        endPoint: ApiConstants.getSupplierProductsEP,
        queries: {'supplierId': supplierId},
      ),
    );

    final SupplierProductsResponse productsResponseModel =
        SupplierProductsResponse.fromJson(response);

    return productsResponseModel.products;
  }
}
