import 'package:dio/dio.dart';

class ErrorHandler {
  static String getErrorMessage(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return 'Connection timed out. Please check your internet connection.';
        case DioExceptionType.badResponse:
          final status = error.response?.statusCode;
          final responseData = error.response?.data;
          if (responseData is Map<String, dynamic> && responseData.containsKey('message')) {
            return responseData['message'] as String;
          }
          if (status == 401) return 'Session expired. Please log in again.';
          if (status == 403) return 'Access denied.';
          if (status == 404) return 'Resource not found.';
          if (status != null && status >= 500) return 'Internal server error. Please try again later.';
          return 'Invalid response from server ($status).';
        case DioExceptionType.cancel:
          return 'Request was cancelled.';
        case DioExceptionType.connectionError:
          return 'No internet connection. Please verify your connection.';
        default:
          return 'An unexpected network error occurred.';
      }
    } else if (error is Exception) {
      return error.toString().replaceAll('Exception: ', '');
    }
    return 'An unknown error occurred.';
  }
}
