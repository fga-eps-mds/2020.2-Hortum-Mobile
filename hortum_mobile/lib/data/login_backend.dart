import 'dart:convert';
import 'package:hortum_mobile/model/userToken.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<UserToken> login(String email, String password) async {
    //Trocar o IPLOCAL pelo ip de sua máquina
    var url = 'http://IPLOCAL:8000/login/';
    var header = {"Content-Type": "application/json"};

    Map params = {
      "email": email,
      "password": password,
    };

    String _body = json.encode(params);
    var response = await http.post(url, headers: header, body: _body);
    Map mapResponse = json.decode(response.body);

    UserToken tokens;

    if (response.statusCode == 200) {
      tokens = UserToken.fromJson(mapResponse);
      tokens.writeSecureData('email', email);
      tokens.writeSecureData('token_refresh', tokens.tokenRefresh);
      tokens.writeSecureData('token_access', tokens.tokenAccess);
    } else {
      tokens = null;
    }

    return tokens;
  }
}
