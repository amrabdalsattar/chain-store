import 'package:dio/dio.dart';

class ApiRequestModel {
  final String endPoint;
  final Map<String, dynamic>? headers;
  final Map<String, dynamic>? body;
  final Map<String, dynamic>? queries;
  final FormData? formData;
  final List<MultipartFile>? files;

  const ApiRequestModel({
    required this.endPoint,
    this.headers,
    this.body,
    this.queries,
    this.formData,
    this.files,
  });
}
