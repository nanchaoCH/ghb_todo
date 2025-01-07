import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../interceptors/token_interceptor.dart';

class ApiServices {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "http://192.168.0.234:5024/api",
    ),
  );

  final TokenInterceptor _tokenInterceptor = TokenInterceptor();

  ApiServices() {
    _dio.interceptors.add(_tokenInterceptor);
    _initializeToken();
  }

  Future<void> _initializeToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("auth_token");

    if (token != null) {
      setAuthToken(token);
    }
  }

  void setAuthToken(String? token) async {
    _tokenInterceptor.setToken(token);

    final prefs = await SharedPreferences.getInstance();

    if (token == null) {
      await prefs.remove("auth_token");
      return;
    }

    await prefs.setString("auth_token", token);
  }

  Future<Response> login(
    String username,
    String password,
  ) async {
    return await _dio.post(
      '/auth/login',
      data: {
        "username": username,
        "password": password,
      },
      options: Options(extra: {"requiresToken": false}),
    );
  }

  Future<Response> logout(String token) async {
    return await _dio.post(
      '/auth/logout',
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
        extra: {"requiresToken": true},
      ),
    );
  }
}
