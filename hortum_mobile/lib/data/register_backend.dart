import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hortum_mobile/globals.dart';

class RegisterApi {
  Dio dio;
  RegisterApi([Dio client]) {
    if (client == null)
      this.dio = Dio();
    else
      this.dio = client;
  }

  Future register(String username, String email, String password,
      String telefone, bool isProductor, BuildContext context) async {
    String urlCustomer = 'http://$ip:8000/signup/customer/';
    String urlProductor = 'http://$ip:8000/signup/productor/';
    Response response;

    var header = {"Content-Type": "application/json"};

    Map params = {
      "user": {
        "username": username,
        "email": email,
        "password": password,
        "phone_number": telefone
      },
    };

    String _body = json.encode(params);
    if (isProductor == false) {
      response = await this.dio.post(urlCustomer,
          data: _body,
          options: Options(
            headers: header,
            validateStatus: (status) {
              return status <= 500;
            },
          ));
    } else {
      response = await dio.post(urlProductor,
          data: _body,
          options: Options(
            headers: header,
            validateStatus: (status) {
              return status <= 500;
            },
          ));
    }
    return response;
  }
}
