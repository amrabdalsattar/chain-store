import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_constants.dart';

class DioFactory {
  const DioFactory._();
  static Dio? _dio;

  static Dio get instance {
    if (_dio != null) return _dio!;

    _dio = Dio()
      ..options.baseUrl = ApiConstants.baseUrl
      ..options.connectTimeout = ApiConstants.timeOut
      ..options.receiveTimeout = ApiConstants.timeOut;

    addDioInterceptors();

    return _dio!;
  }

  static void addDioInterceptors() {
    _dio?.interceptors.addAll([
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
        responseBody: true,
        error: true,
      ),
    ]);
  }
}
