import 'dart:convert';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/model/user.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<User> login(String email, String password) async {
    //Trocar o IPLOCAL pelo ip de sua máquina
    Uri url = Uri.parse('http://$ip:8000/login/');
    var header = {"Content-Type": "application/json"};

    Map params = {
      "email": email,
      "password": password,
    };

    String _body = json.encode(params);
    var response = await http.post(url, headers: header, body: _body);
    Map mapResponse = json.decode(response.body);
    print(mapResponse);
    mapResponse['password'] = password;

    if (response.statusCode == 200) {
      actualUser = User.fromJson(mapResponse);
      print(actualUser.phone_number);
      actualUser.writeSecureData('email', actualUser.email);
      actualUser.writeSecureData('token_refresh', actualUser.tokenRefresh);
      actualUser.writeSecureData('token_access', actualUser.tokenAccess);
      actualUser.writeSecureData('phone_number', actualUser.phone_number);
    } else {
      actualUser = null;
    }
    print(actualUser.phone_number);
    return actualUser;
  }
}
