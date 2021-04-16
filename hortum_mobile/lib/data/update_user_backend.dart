import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:hortum_mobile/globals.dart';

class UpdateUserAPI {
  Dio dio;

  UpdateUserAPI([Dio client]) {
    if (client == null) {
      this.dio = Dio();
    } else {
      this.dio = client;
    }
  }
  Future updateUser(String username, String email) async {
    //Trocar o IPLOCAL pelo ip de sua máquina
    String url = 'http://$ip:8000/users/update/';

    var header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + actualUser.tokenAccess,
    };

    Map params = {
      "username": username,
      "email": email,
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
}
