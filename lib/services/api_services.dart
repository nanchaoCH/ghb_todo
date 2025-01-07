import 'package:dio/dio.dart';

class ApiServices {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "http://192.168.0.234:5024/api",
    ),
  );

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
    );
  }

  Future<Response> logout(String token) async {
    return await _dio.post(
      '/auth/logout',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
  }
}
