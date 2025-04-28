import 'package:dio/dio.dart';

import '../../helpers/constant_string.dart';
import 'api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          return ApiErrorModel(message: 'No internet connection');
        case DioExceptionType.cancel:
          return ApiErrorModel(message: 'Request cancelled');
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(message: 'Connection timed out');
        case DioExceptionType.unknown:
          return ApiErrorModel(message: ConstantString.unknownError);
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(message: 'Failed to receive data');
        case DioExceptionType.badResponse:
          return _handleError(error.response?.data);
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(message: 'Failed to send data');
        default:
          return ApiErrorModel(message: 'Something went wrong');
      }
    } else if (error is FormatException) {
      // JSON parsing failed
      return ApiErrorModel(message: error.message);
    } else {
      return ApiErrorModel(message: 'Unexpected error occurred');
    }
  }
}

ApiErrorModel _handleError(dynamic data) {
  try {
    // Check if 'data' is a map and has 'message' and 'errors'
    final message = data['message'];
    final errorCode = data['errorCode'];
    final errors =
        data['errors'] is List ? List<String>.from(data['errors']) : null;

    return ApiErrorModel(
      message: message,
      errorCode: errorCode,
      errors: errors,
    );
  } catch (e) {
    return ApiErrorModel(
      message: 'An error occurred while parsing the error response.',
      errors: [],
    );
  }
}
