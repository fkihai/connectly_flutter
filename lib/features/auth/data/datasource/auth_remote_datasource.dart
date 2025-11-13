import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDatasource {
  Future<Map<String, dynamic>> login(String username, String password) async {
    Uri url = Uri.parse("http://192.168.101.10:3000/auth/login");
    Map<String, String> headers = {'Content-Type': 'application/json'};

    Map<String, dynamic> body = {"username": username, "password": password};
    http.Response response = await http.post(
      url,
      body: jsonEncode(body),
      headers: headers,
    );

    debugPrint("status code : ${response.statusCode}");

    Map<String, dynamic> data = jsonDecode(response.body)['data'];

    return data;
  }
}
