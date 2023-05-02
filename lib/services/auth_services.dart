// Digunakan untuk melakukan request terhadap backEnd

import 'dart:convert';

import 'package:flutter/foundation.dart';
import '../../models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String baseUrl = 'https://shamo-backend.buildwithangga.id/api';

  Future<UserModel> register(
      String name, String username, String email, String password) async {
    var url = '$baseUrl/register';
    var headers = {'Content-Type': 'application/json'};
    // Mengubah json ke model
    var body = jsonEncode(
      {
        'name': name,
        'username': username,
        'email': email,
        'password': password,
      },
    );

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    // Apakah response 200
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      // Ini untuk tambahkan token
      user.token = 'Bearer ${data["acces_token"]}';

      if (kDebugMode) {
        print(response.body);
      }

      return user;
    } else {
      throw Exception('Gagal Register');
    }
  }

  Future<UserModel> login(String email, String password) async {
    var url = '$baseUrl/login';
    var headers = {'Content-Type': 'application/json'};
    // Mengubah json ke model
    var body = jsonEncode(
      {
        'email': email,
        'password': password,
      },
    );

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    // Apakah response 200
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      // Ini untuk tambahkan token
      user.token = 'Bearer ${data["access_token"]}';

      if (kDebugMode) {
        print(response.body);
      }

      return user;
    } else {
      throw Exception('Gagal Login');
    }
  }
}
