import 'dart:convert';
import 'package:hortum_mobile/globals.dart';
import 'package:http/http.dart' as http;

class UpdateUserAPI {
  static Future updateUser(String username, String email) async {
    //Trocar o IPLOCAL pelo ip de sua máquina
    var url = 'http://$ip:8000/users/update/';
    String userAccessToken = await actualUser.readSecureData('token_access');
    var header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + userAccessToken,
    };

    Map params = {
      "username": username,
      "email": email,
    };

    String _body = json.encode(params);
    var response = await http.put(url, headers: header, body: _body);
    String strResponse = json.decode(response.body);
    if (response.statusCode == 200) {
      return strResponse;
    } else {
      return null;
    }
  }
}
