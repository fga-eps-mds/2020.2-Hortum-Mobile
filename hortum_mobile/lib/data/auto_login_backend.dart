import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:hortum_mobile/globals.dart';

class AutomaticLoginAPI {
  static Dio dio;

  AutomaticLoginAPI([Dio client]) {
    if (client == null) {
      dio = Dio();
    } else {
      dio = client;
    }
  }

  static Future<bool> automaticLogin() async {
    //Trocar o IPLOCAL pelo ip de sua máquina
    String userAccessToken = actualUser.tokenAccess;
    String urlTest = 'http://$ip:8000/api/test_token/';
    String urlRefresh = 'http://$ip:8000/login/refresh/';

    var header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + userAccessToken,
    };

    Map params = {"access": userAccessToken};
    String _body = json.encode(params);
    var response = await dio.get(urlTest, options: Options(headers: header));

    if (response.statusCode != 200) {
      response = await dio.post(urlRefresh, data: _body);
      String newToken = json.decode(response.data)['access'];
      actualUser.updateToken(newToken);
      header['Authorization'] = "Bearer " + newToken;
      response = await dio.get(urlTest, options: Options(headers: header));
    }

    String username = json.decode(response.data)['user'];
    bool isProductor = json.decode(response.data)['is_productor'];
    actualUser.initAutoLogin(isProductor, username);

    return isProductor;
  }
}
