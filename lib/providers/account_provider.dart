import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ghb_todo/services/api_services.dart';

class AccountProvider with ChangeNotifier {
  final ApiServices _apiService = ApiServices();

  String? _token;
  String? _user;

  String? get token => _token;
  String? get user => _user;

  bool isLoggedIn() => _token != null;

  Future<bool> login(String email, String password) async {
    final response = await _apiService.login(email, password);

    if (response.statusCode == HttpStatus.ok) {
      _token = response.data["token"];
      _user = response.data["user"];

      notifyListeners();
      return true;
    }

    return false;
  }

  Future<bool> logout() async {
    if (_token == null) return false;

    final response = await _apiService.logout(_token!);

    if (response.statusCode == HttpStatus.ok) {
      _token = null;
      _user = null;

      notifyListeners();

      return true;
    }

    return false;
  }
}
