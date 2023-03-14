import 'package:dio/dio.dart';

class ApiException implements Exception {
  const ApiException({
    required this.statusCode,
    required this.errorMessage,
  });

  final int statusCode;
  final String? errorMessage;

  factory ApiException.from(Response? response) {
    final data = response?.data;

    return ApiException(
      statusCode: response?.statusCode ?? 0,
      errorMessage:
          data is Map<String, dynamic> ? data['error_description'] : null,
    );
  }
}
