import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/views/login/login_page.dart';

class RegisterApi {
  Dio dio;

  RegisterApi([Dio client]) {
    if (client == null)
      this.dio = Dio();
    else
      this.dio = client;
  }

  Future register(String username, String email, String password,
      bool isProductor, BuildContext context) async {
    String urlCustomer = 'http://$ip:8000/signup/customer/';
    String urlProductor = 'http://$ip:8000/signup/productor/';
    Response response;

    var header = {"Content-Type": "application/json"};

    String filename = profile_picture.path.split('/').last;
    var params = FormData.fromMap({
      "user.username": username,
      "user.email": email,
      "user.password": password,
      "user.profile_picture":
          await MultipartFile.fromFile(profile_picture.path, filename: filename)
    });

    if (isProductor == false) {
      response = await this.dio.post(urlCustomer,
          data: params,
          options:
              Options(headers: header, contentType: 'multipart/form-data'));
    } else {
      response = await dio.post(urlProductor,
          data: params,
          options:
              Options(headers: header, contentType: 'multipart/form-data'));
    }
    if (response.statusCode == 201) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LoginPage();
      }));
    }
    // else {}
  }
}
