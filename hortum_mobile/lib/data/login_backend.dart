import 'dart:convert';
import 'package:hortum_mobile/model/userLogin.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<UserLogin> login(String email, String password) async {
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

    UserLogin user;

    if (response.statusCode == 200) {
      user = UserLogin.fromJson(mapResponse);
    } else {
      user = null;
    }

    return user;
  }
}
