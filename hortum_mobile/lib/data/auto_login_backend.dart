import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:hortum_mobile/globals.dart';

class AutomaticLoginAPI {
  static Dio dio = Dio();

  static Future<bool> automaticLogin(String tokenAccess) async {
    //Trocar o IPLOCAL pelo ip de sua máquina

    String userAccessToken = tokenAccess;
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

    String username = response.data['user'];
    bool isProductor = response.data['is_productor'];
    actualUser.initAutoLogin(isProductor, username);

    return isProductor;
  }
}
