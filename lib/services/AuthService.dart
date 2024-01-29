import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final String apiUrl = 'https://reqres.in/api/';
  Future<Map<String, dynamic>?> login(String email, String password) async {
    Map<String, String> requestBody = {
      'email': email,
      'password': password,
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl + "login/"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      }
    } catch (error) {
      print('Error during login: $error');
    }
    return null;
  }

  Future<Map<String, dynamic>?> register(String email, String password) async {
    Map<String, String> requestBody = {
      'email': email,
      'password': password,
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl + "register/"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      }
    } catch (error) {
      print('Error during registration: $error');
    }
    return null;
  }
}
