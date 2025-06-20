import '../../../../core/helpers/token_helper.dart';
import '../../../../core/networking/api_constants.dart';
import '../../../../core/networking/api_helper.dart';
import '../../../../core/networking/api_request_model.dart';
import '../../../home/data/models/suppliers_response_model.dart';

class SuppliersDatasource {
  final ApiHelper _apiHelper;
  const SuppliersDatasource(this._apiHelper);

  Future<List<SupplierDataModel>> exploreSuppliers(String query) async {
    final response = await _apiHelper.get(
      ApiRequestModel(
        endPoint: ApiConstants.exploreSuppliersEP,
        queries: {'searchName': query},
        headers: {
          'Authorization': 'Bearer ${await TokenHelper.getSecuredUserToken()}',
        },
      ),
    );

    final SupplierResponseModel supplierResponseModel =
        SupplierResponseModel.fromJson(response);

    return supplierResponseModel.suppliers;
  }
}
