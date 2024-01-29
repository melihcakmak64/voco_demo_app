import 'package:flutter/material.dart';
import 'package:voco_demo/model/User.dart';
import 'package:voco_demo/sevices/NetworkService.dart';

class HomePageController extends ChangeNotifier {
  NetworkService networkService = NetworkService();
  List<User> userList = [];
  bool isLoading = false;

  void fetchData() async {
    try {
      isLoading = true;
      notifyListeners();
      userList = await networkService.fetchData();
      isLoading = false;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
