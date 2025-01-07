import 'package:dio/dio.dart';

class TokenInterceptor extends Interceptor {
  String? _token;

  void setToken(String? token) {
    _token = token;
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    final bool requiresToken = options.extra["requiresToken"] ?? true;

    if (requiresToken && _token != null) {
      options.headers["Authorization"] = "Bearer $_token";
    }

    super.onRequest(options, handler);
  }
}
