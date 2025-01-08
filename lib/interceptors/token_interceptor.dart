import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ghb_todo/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

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

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == HttpStatus.unauthorized) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('token');

      navigatorKey.currentState?.pushReplacementNamed(AppRoutes.login);
      return;
    }

    super.onError(err, handler);
  }
}
