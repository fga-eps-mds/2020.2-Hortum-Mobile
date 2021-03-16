import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<bool> login(String email, String password) async {
    //Trocar i IPLOCAL pelo ip de sua máquina(ipconfig no cmd do windows ou ifconfig no linux)
    var url = 'http://IPLOCAL:8000/signup/api/token/';
    var header = {"Content-Type": "application/json"};
    Map params = {
      "email": email,
      "password": password,
    };

    String _body = json.encode(params);

    var response = await http.post(url, headers: header, body: _body);
    //Status retornado pelo backend
    print('Response status: ${response.statusCode}');
    //Resultado da requisição
    print('Response body: ${response.body}');
    return true;
  }
}
