

import 'dart:convert';


import 'package:foab_e_traceablity/network/requestModel/login_request.dart';
import 'package:foab_e_traceablity/network/response_model/response_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../api_constant/api_constant.dart';

LoginResponse loginResponse = LoginResponse();
class NetworkManager {

  Future<LoginResponse> logIn(LoginRequest request) async {
    String url = AppConstant().baseUrl + AppConstant().loginUrl;
    print(url);
    print(jsonEncode(request));
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(request),
      headers: {'Content-Type': 'application/json'},
    );
    print(response.body);
    if (response.statusCode == 200) {
      print(response.body);
      final body = jsonDecode(response.body);
      loginResponse = LoginResponse.fromJson(body);
      return LoginResponse.fromJson(body);
    }
    else{
      final body = jsonDecode(response.body);
      throw Exception(body["encoded"]["error"]["errMsg"]);}
  }




}
