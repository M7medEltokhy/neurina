
import 'package:dio/dio.dart';
import 'package:neurina/core/network/api_error.dart';

class ApiExceptions {
  static ApiError handleError(DioException error) {

    final statusCode = error.response?.statusCode;
    final data = error.response?.data;
    if (statusCode != null && data is Map<String, dynamic>){
      return ApiError(message: data['message'], statusCode: statusCode);
    }

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ApiError(message: 'Connection timeout with API server');
      case DioExceptionType.sendTimeout:
        return ApiError(message: 'Send timeout with API server');
      case DioExceptionType.receiveTimeout:
        return ApiError(message: 'Receive timeout in connection with API server');
      case DioExceptionType.badResponse:
        return ApiError(message: 'Something went wrong');
      case DioExceptionType.badCertificate:
        return ApiError(message: 'Bad certificate');
      case DioExceptionType.cancel:
        return ApiError(message: 'Request to API server was cancelled');
      case DioExceptionType.connectionError:
        return ApiError(message: 'Connection error with API server');
      case DioExceptionType.unknown:
        return ApiError(message: 'Something went wrong');
    }
  }
}