import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:hortum_mobile/globals.dart';

class DeleteUserAPI {
  Dio dio;

  DeleteUserAPI([Dio client]) {
    if (client == null) {
      this.dio = Dio();
    } else {
      this.dio = client;
    }
  }
  Future deleteUser(String password) async {
    //Trocar o IPLOCAL pelo ip de sua máquina
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
