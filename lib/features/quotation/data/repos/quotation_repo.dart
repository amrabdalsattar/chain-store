import '../../../../core/networking/api_error_handler/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../datasource/quotation_datasource.dart';
import '../models/quotation_model.dart';
import '../models/rfq_model.dart';
import '../models/rfq_request_model.dart';
import '../models/rfq_category_response.dart';
import '../models/rfq_recommended_supplier_response.dart';

class QuotationRepo {
  final QuotationDatasource _quotationDatasource;

  QuotationRepo(this._quotationDatasource);

  Future<ApiResult<RfqRecommendedSupplierResponse>> getRecommendedSuppliers(
    String quotationId,
  ) async {
    try {
      final response = await _quotationDatasource.getRecommendedSuppliers(
        quotationId,
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<RFQCategoryResponse>> getAllCategories() async {
    try {
      final categories = await _quotationDatasource.getAllCategories();
      return ApiResult.success(categories);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<int>> createQuotation(
    RFQRequestModel rfqRequestModel,
  ) async {
    try {
      final response = await _quotationDatasource.createRFQ(rfqRequestModel);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<RFQModel>>> getCustomerRFQs() async {
    try {
      final quotations = await _quotationDatasource.getCustomerRFQs();
      return ApiResult.success(quotations);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<RFQModel>> getCustomerQuotationById(int id) async {
    try {
      final quotation = await _quotationDatasource.getCustomerQuotationById(id);
      return ApiResult.success(quotation);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<String>> assignSupplierToRFQ(
    int rfqId,
    List<String> supplierIds,
  ) async {
    try {
      await _quotationDatasource.assignSupplierToRFQ(rfqId, supplierIds);
      return const ApiResult.success('Operation Completed Succesfully');
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<QuotationResponseModel>> getRFQQuotations(
    String rfqId,
  ) async {
    try {
      final response = await _quotationDatasource.getRFQQuotations(rfqId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<QuotationModel>> getQuotationDeatils(
    String quotationId,
  ) async {
    try {
      final response = await _quotationDatasource.getQuotationDetail(
        quotationId,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<String>> acceptQuotatoin(int quotationId) async {
    try {
      final response = await _quotationDatasource.acceptQuotation(quotationId);
      return const ApiResult.success('Quotation Accepted');
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<String>> rejectQuotation(int quotationId) async {
    try {
      final response = await _quotationDatasource.rejectQuotation(quotationId);
      return const ApiResult.success('Quotation Rejected');
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
