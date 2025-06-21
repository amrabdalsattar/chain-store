import '../../../../core/helpers/token_helper.dart';
import '../../../../core/networking/api_constants.dart';
import '../../../../core/networking/api_helper.dart';
import '../../../../core/networking/api_request_model.dart';
import '../models/products_response_model.dart';
import '../models/suppliers_response_model.dart';

class HomeRemoteDataSource {
  final ApiHelper _apiHelper;
  HomeRemoteDataSource(this._apiHelper);

  Future<List<SupplierDataModel>> getTopSuppliers() async {
    final response = await _apiHelper.get(
      ApiRequestModel(
        endPoint: ApiConstants.getTopSuppliersEP,
        headers: {
          'Authorization': 'Bearer ${await TokenHelper.getSecuredUserToken()}',
        },
      ),
    );

    final SupplierResponseModel supplierResponseModel =
        SupplierResponseModel.fromJson(response);

    return supplierResponseModel.suppliers;
  }

  Future<List<ProductDataModel>> getMatchedProducts() async {
    final response = await _apiHelper.get(
      ApiRequestModel(
        endPoint: ApiConstants.getMatchedProductsEP,
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
