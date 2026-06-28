import 'package:dio/dio.dart';
import '../local/local_storage.dart';

class ApiInterceptor extends Interceptor {
  final LocalStorageService _storage;

  ApiInterceptor(this._storage);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = _storage.accessToken;
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      // Handle unauthorized error (e.g. clear session)
      _storage.clearSession();
    }
    super.onError(err, handler);
  }
}
