import 'dart:convert';

import 'package:voco_demo/model/User.dart';
import 'package:http/http.dart' as http;

class NetworkService {
  final String BASE_URL = "https://reqres.in/api/";
  Future<List<User>> fetchData() async {
    final response = await http.get(Uri.parse(BASE_URL + "users"));
    if (response.statusCode == 200) {
      // Parse the JSON response
      final Map<String, dynamic> data = json.decode(response.body);
      List userList = data["data"];
      List<User> liste = userList.map((e) => User.fromJson(e)).toList();
      return liste;
    }
    return List<User>.empty();
  }
}
