import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../interceptors/token_interceptor.dart';

class ApiServices {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://todo-api.staging.codehard.co.th/api",
      headers: {
        'accept': '*/*',
        'Content-Type': 'application/json',
      },
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

  Future<Response> createTodoAsync({
    required String title,
    required String priority,
    required String status,
    required DateTime dueDate,
  }) async {
    return await _dio.post(
      '/Todo',
      data: {
        "title": title,
        "priority": priority,
        "status": status,
        "dueDate": dueDate.toUtc().toIso8601String(),
        "createdBy": "user"
      },
      options: Options(extra: {"requiresToken": true}),
    );
  }

  Future<Response> updateTodoAsync({
    required String id,
    required String title,
    required String priority,
    required String status,
    required DateTime dueDate,
  }) async {
    final data = {
      "id": id,
      "title": title,
      "priority": priority,
      "status": status,
      "dueDate": dueDate.toUtc().toIso8601String(),
      "updatedBy": "user"
    };

    return await _dio.put(
      '/Todo/$id',
      data: data,
    );
  }

  Future<Response> getTodoListAsync() {
    return _dio.get('/Todo');
  }

  Future<Response> getTodoByIdAsync({
    required String todoId,
  }) {
    return _dio.get('/Todo/$todoId');
  }
}
