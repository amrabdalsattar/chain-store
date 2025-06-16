import 'package:dio/dio.dart';

import 'api_constants.dart';
import 'api_request_model.dart';

abstract class ApiHelper {
  Future<dynamic> get(ApiRequestModel apiRequestModel);
  Future<dynamic> post(ApiRequestModel apiRequestModel);
  Future<dynamic> delete(ApiRequestModel apiRequestModel);
  Future<dynamic> put(ApiRequestModel apiRequestModel);
}

class DioHelper implements ApiHelper {
  final Dio _dio;
  const DioHelper(this._dio);

  String _buildFullUrl(String endpoint, {String? baseUrl}) {
    return baseUrl == null
        ? '${ApiConstants.baseUrl}$endpoint'
        : '$baseUrl$endpoint';
  }

  @override
  Future<dynamic> get(ApiRequestModel apiRequestModel) async {
    final response = await _dio.get(
      _buildFullUrl(apiRequestModel.endPoint, baseUrl: apiRequestModel.baseUrl),
      queryParameters: apiRequestModel.queries,
      data: apiRequestModel.body,
      options: Options(headers: apiRequestModel.headers),
    );

    return response.data;
  }

  @override
  Future<dynamic> post(ApiRequestModel apiRequestModel) async {
    final response = await _dio.post(
      _buildFullUrl(apiRequestModel.endPoint, baseUrl: apiRequestModel.baseUrl),
      queryParameters: apiRequestModel.queries,
      data: apiRequestModel.body ?? apiRequestModel.formData,
      options: Options(
        headers: apiRequestModel.headers,
        contentType:
            apiRequestModel.headers?.containsKey('Content-Type') ?? false
                ? apiRequestModel.headers!['Content-Type']
                : apiRequestModel.formData != null
                ? 'multipart/form-data'
                : 'application/json',
      ),
    );

    return response.data;
  }

  @override
  Future<dynamic> delete(ApiRequestModel apiRequestModel) async {
    final response = await _dio.delete(
      _buildFullUrl(apiRequestModel.endPoint, baseUrl: apiRequestModel.baseUrl),
      queryParameters: apiRequestModel.queries,
      data: apiRequestModel.body,
      options: Options(headers: apiRequestModel.headers),
    );

    return response.data;
  }

  @override
  Future<dynamic> put(ApiRequestModel apiRequestModel) async {
    final response = await _dio.put(
      _buildFullUrl(apiRequestModel.endPoint, baseUrl: apiRequestModel.baseUrl),
      queryParameters: apiRequestModel.queries,
      data:
          apiRequestModel.formData ??
          apiRequestModel.body, // Use formData if provided
      options: Options(headers: apiRequestModel.headers),
    );

    return response.data;
  }
}
