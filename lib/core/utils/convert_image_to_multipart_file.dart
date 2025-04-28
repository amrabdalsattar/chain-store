import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

Future<MultipartFile> convertImageToMultipartFile(
    File image, String fieldName) async {
  final mimeType = lookupMimeType(image.path)?.split('/') ?? ['image', 'jpeg'];
  final filename = image.path.split('/').last;

  return await MultipartFile.fromFile(
    image.path,
    filename: filename,
    contentType: MediaType(mimeType[0], mimeType[1]),
  );
}
