import 'dart:convert';
import 'package:hortum_mobile/globals.dart';
import 'package:http/http.dart' as http;

class AutomaticLoginAPI {
  static Future<bool> automaticLogin() async {
    actualUser.deleteUser();
    //Trocar o IPLOCAL pelo ip de sua máquina
    String userAccessToken = await actualUser.readSecureData('token_access');
    Uri urlTest = Uri.parse('http://$ip:8000/api/test_token/');
    Uri urlRefresh = Uri.parse('http://$ip:8000/login/refresh/');
    var header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + userAccessToken,
    };

    Map params = {"access": userAccessToken};
    String _body = json.encode(params);
    var response = await http.get(urlTest, headers: header);

    if (response.statusCode != 200) {
      response = await http.post(urlRefresh, body: _body);
      String newToken = json.decode(response.body)['access'];
      actualUser.updateToken(newToken);
      header['Authorization'] = "Bearer " + newToken;
      response = await http.get(urlTest, headers: header);
    }

    String username = json.decode(response.body)['user'];
    bool isProductor = json.decode(response.body)['is_productor'];
    actualUser.initAutoLogin(isProductor, username);

    return isProductor;
  }
}
