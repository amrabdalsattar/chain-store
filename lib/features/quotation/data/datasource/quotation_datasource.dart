import '../../../../core/helpers/token_helper.dart';
import '../../../../core/networking/api_constants.dart';
import '../../../../core/networking/api_helper.dart';
import '../../../../core/networking/api_request_model.dart';
import '../models/quotation_model.dart';
import '../models/rfq_model.dart';
import '../models/rfq_request_model.dart';
import '../models/rfq_category_response.dart';
import '../models/rfq_recommended_supplier_response.dart';

class QuotationDatasource {
  final ApiHelper _apiHelper;

  QuotationDatasource(this._apiHelper);

  Future<RFQCategoryResponse> getAllCategories() async {
    final response = await _apiHelper.get(
      const ApiRequestModel(endPoint: ApiConstants.getAllCategoriesEP),
    );
    return RFQCategoryResponse.fromJson(response);
  }

  Future<int> createRFQ(RFQRequestModel RFQRequestModel) async {
    final response = await _apiHelper.post(
      ApiRequestModel(
        endPoint: ApiConstants.createRFQEP,
        headers: {
          'Authorization': 'Bearer ${await TokenHelper.getSecuredUserToken()}',
        },
        body: RFQRequestModel.toJson(),
      ),
    );
    return response['data'];
  }

  Future<List<RFQModel>> getCustomerRFQs() async {
    final response = await _apiHelper.get(
      ApiRequestModel(
        endPoint: ApiConstants.getCustomerRFQsEP,
        headers: {
          'Authorization': 'Bearer ${await TokenHelper.getSecuredUserToken()}',
        },
      ),
    );
    return (response['data'] as List)
        .map((e) => RFQModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<RFQModel> getCustomerQuotationById(int id) async {
    final response = await _apiHelper.get(
      ApiRequestModel(
        endPoint: '${ApiConstants.getCustomerQuotationByIdEP}/$id',
        headers: {
          'Authorization': 'Bearer ${await TokenHelper.getSecuredUserToken()}',
        },
      ),
    );
    return RFQModel.fromJson(response);
  }

  Future<RfqRecommendedSupplierResponse> getRecommendedSuppliers(
    String quotationId,
  ) async {
    final response = await _apiHelper.get(
      ApiRequestModel(
        endPoint: 'RFQ/$quotationId/RecommendedSuppliers',
        headers: {
          'Authorization': 'Bearer ${await TokenHelper.getSecuredUserToken()}',
        },
      ),
    );
    return RfqRecommendedSupplierResponse.fromJson(response);
  }

  Future<void> assignSupplierToRFQ(int rfqId, List<String> supplierIds) async {
    await _apiHelper.post(
      ApiRequestModel(
        endPoint: ApiConstants.assignSupplierToRFQEP,
        headers: {
          'Authorization': 'Bearer ${await TokenHelper.getSecuredUserToken()}',
        },
        body: {'rfqId': rfqId, 'supplierIds': supplierIds},
      ),
    );
  }

  Future<QuotationResponseModel> getRFQQuotations(String rfqId) async {
    final resposne = await _apiHelper.get(
      ApiRequestModel(
        endPoint: '${ApiConstants.getRFQQuotationsEp}/$rfqId',
        headers: {
          'Authorization': 'Bearer ${await TokenHelper.getSecuredUserToken()}',
        },
      ),
    );
    return QuotationResponseModel.fromJson(resposne);
  }

  Future<QuotationModel> getQuotationDetail(String quotationId) async {
    final response = await _apiHelper.get(
      ApiRequestModel(
        endPoint: '${ApiConstants.getQuotationDetailsEP}$quotationId',
      ),
    );
    return QuotationModel.fromJson(response['data']);
  }

  Future<void> acceptQuotation(int quotationId) async {
    final response = await _apiHelper.post(
      ApiRequestModel(
        endPoint: '${ApiConstants.acceptQuotationEP}/$quotationId',
        headers: {
          'Authorization': 'Bearer ${await TokenHelper.getSecuredUserToken()}',
        },
      ),
    );
  }

  Future<void> rejectQuotation(int quotationId) async {
    final response = await _apiHelper.post(
      ApiRequestModel(
        endPoint: ApiConstants.rejectQuoationEP,
        headers: {
          'Authorization':
              'Bearer ${await TokenHelper.getSecuredUserToken()}/$quotationId',
        },
      ),
    );
  }
}
