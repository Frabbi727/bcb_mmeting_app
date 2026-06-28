import 'package:dio/dio.dart';
import '../../core/values/constants.dart';
import '../local/local_storage.dart';
import 'api_interceptors.dart';

class ApiClient {
  late final Dio dio;

  ApiClient(LocalStorageService storage) {
    dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseUrl,
        connectTimeout: const Duration(milliseconds: AppConstants.connectTimeout),
        receiveTimeout: const Duration(milliseconds: AppConstants.receiveTimeout),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );

    dio.interceptors.add(ApiInterceptor(storage));
    dio.interceptors.add(LogInterceptor(
      requestHeader: true,
      requestBody: true,
      responseHeader: false,
      responseBody: true,
      error: true,
    ));
  }
}
