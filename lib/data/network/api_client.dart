import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../core/values/constants.dart';
import '../../core/values/env_config.dart';
import 'api_interceptors.dart';

class ApiClient {
  late final Dio _dio;

  ApiClient() {
    final env = Get.find<EnvConfig>();

    _dio = Dio(
      BaseOptions(
        baseUrl: env.baseUrl,
        connectTimeout: const Duration(milliseconds: AppConstants.connectTimeout),
        receiveTimeout: const Duration(milliseconds: AppConstants.receiveTimeout),
      ),
    );

    _dio.interceptors.add(ApiInterceptors());

    // Enable detailed terminal logs in non-production environments
    if (env.environment != Environment.production) {
      _dio.interceptors.add(LogInterceptor(
        requestHeader: true,
        requestBody: true,
        responseHeader: false,
        responseBody: true,
        error: true,
      ));
    }
  }

  Dio get dio => _dio;
}
