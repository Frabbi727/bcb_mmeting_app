import 'package:dio/dio.dart';
import 'package:get/get.dart' as get_x;
import '../../core/routes/app_pages.dart';
import '../../core/values/api_endpoints.dart';
import '../../core/values/env_config.dart';
import '../local/local_storage.dart';

class ApiInterceptors extends QueuedInterceptor {
  final LocalStorageService _storage = get_x.Get.find<LocalStorageService>();
  final _refreshDio = Dio(); // Clean Dio instance to avoid recursive loops

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = _storage.accessToken;
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final refreshToken = _storage.refreshToken;
      
      // Local developer bypass checking: if mock testing, don't execute actual network refresh
      if (refreshToken == 'mock_refresh_token') {
        super.onError(err, handler);
        return;
      }
      
      if (refreshToken == null || refreshToken.isEmpty) {
        _handleLogout();
        super.onError(err, handler);
        return;
      }

      try {
        final env = get_x.Get.find<EnvConfig>();
        final response = await _refreshDio.post<Map<String, dynamic>>(
          '${env.baseUrl}${ApiEndPoints.refresh}',
          data: {'refreshToken': refreshToken},
        );

        if (response.statusCode == 200 && response.data != null) {
          final newAccessToken = response.data!['accessToken'] as String? ?? '';
          final newRefreshToken = response.data!['refreshToken'] as String? ?? '';

          await _storage.saveAccessToken(newAccessToken);
          if (newRefreshToken.isNotEmpty) {
            await _storage.saveRefreshToken(newRefreshToken);
          }

          // Re-attempt original request options with new credentials
          final options = err.requestOptions;
          options.headers['Authorization'] = 'Bearer $newAccessToken';

          final retryDio = Dio();
          final retryResponse = await retryDio.request(
            options.path,
            options: Options(
              method: options.method,
              headers: options.headers,
              contentType: options.contentType,
              responseType: options.responseType,
            ),
            data: options.data,
            queryParameters: options.queryParameters,
          );
          
          handler.resolve(retryResponse);
          return;
        }
      } catch (_) {
        _handleLogout();
      }
    }
    super.onError(err, handler);
  }

  void _handleLogout() {
    _storage.clearSession();
    get_x.Get.offAllNamed(Routes.login);
  }
}
