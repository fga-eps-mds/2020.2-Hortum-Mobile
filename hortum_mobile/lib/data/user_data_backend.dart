import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hortum_mobile/globals.dart';

class UserAPI {
  Dio dio;

  UserAPI([Dio client]) {
    if (client == null) {
      this.dio = Dio();
    } else {
      this.dio = client;
    }
  }

  Future updateUser(
      {String username, String email, String phone_number}) async {
    //Trocar o IPLOCAL pelo ip de sua máquina
    String url = 'http://$ip:8000/users/update/';

    var header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + actualUser.tokenAccess,
    };

    Map params = {
      "username": username,
      "email": email,
      "phone_number": phone_number
    };
    params.removeWhere((key, value) => value == null);

    String _body = json.encode(params);
    Response response = await dio.patch(url,
        data: _body,
        options: Options(
          headers: header,
          validateStatus: (status) {
            return status <= 500;
          },
        ));
    return response;
  }

  Future changePassword(String actualPassword, String newPassword) async {
    //Trocar o IPLOCAL pelo ip de sua máquina
    var url = 'http://$ip:8000/users/change-password/';
    var header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + actualUser.tokenAccess,
    };

    Map params = {
      "old_password": actualPassword,
      "new_password": newPassword,
    };

    String _body = json.encode(params);
    Response response = await dio.patch(url,
        data: _body,
        options: Options(
          headers: header,
          validateStatus: (status) {
            return status <= 500;
          },
        ));
    return response.statusCode;
  }

  Future deleteUser(String password) async {
    String url = 'http://$ip:8000/users/delete/';

    var header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + actualUser.tokenAccess,
    };

    Map params = {
      "password": password,
    };

    String _body = json.encode(params);
    Response response = await dio.delete(url,
        data: _body,
        options: Options(
          headers: header,
          validateStatus: (status) {
            return status <= 500;
          },
        ));
    return response;
  }
}
