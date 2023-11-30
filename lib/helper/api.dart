import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class Api {
  Future<dynamic> get({required String url}) async {
    Response response = await Dio().get(url);
    if (response.statusCode == 200) {
      jsonDecode(response.data);
    } else {
      throw Exception('there was an error ==> ${response.statusCode}');
    }
  }

  Future<dynamic> post({required String url, @required dynamic body}) async {
    Response response = await Dio().post(url, data: body);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.data);
      return data;
    } else {
      throw Exception('there was an error ==> ${response.statusCode}');
    }
  }

  Future<dynamic> put({required String url, @required dynamic body}) async {
    Response response = await Dio().post(url, data: body);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.data);
      return data;
    } else {
      throw Exception('there was an error ==> ${response.statusCode}');
    }
  }
}
