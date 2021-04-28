import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:hortum_mobile/globals.dart';

class RegisterApi {
  Dio dio;
  RegisterApi([Dio client]) {
    if (client == null)
      this.dio = Dio();
    else
      this.dio = client;
  }

  Future register(
      String username, String email, String password, bool isProductor) async {
    String urlCustomer = 'http://$ip:8000/signup/customer/';
    String urlProductor = 'http://$ip:8000/signup/productor/';

    var header = {"Content-Type": "application/json"};

    Map params = {
      "user": {
        "username": username,
        "email": email,
        "password": password,
      },
    };

    String _body = json.encode(params);
    if (isProductor == false) {
      await this
          .dio
          .post(urlCustomer, data: _body, options: Options(headers: header));
    } else {
      await dio.post(urlProductor,
          data: _body, options: Options(headers: header));
    }
    // Exemplo de código para depois que a conta for criada
    // if (response.statusCode == 201) {}
    // else {}
  }
}
