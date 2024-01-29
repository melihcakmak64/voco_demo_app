import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voco_demo/sevices/AuthService.dart';

class AuthController extends ChangeNotifier {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  AuthService authService = AuthService();
  String? token;

  bool isLogged = false;

  Future<bool> register() async {
    var response = await authService.register(email.text, password.text);
    return response != null;
  }

  Future<bool> login() async {
    var response = await authService.login(email.text, password.text);
    if (response != null) {
      isLogged = true;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("_token", response["token"]);
      token = response["token"];
    }

    notifyListeners();

    return isLogged;
  }

  Future<bool> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var response = prefs.getString("_token");
    if (response == null) {
      return false;
    } else {
      token = response;
      isLogged = true;
      notifyListeners();
      return isLogged;
    }
  }
}
