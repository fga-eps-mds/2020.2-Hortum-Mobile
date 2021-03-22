import 'dart:convert';
import 'package:http/http.dart' as http;

class RegisterApi {
  static Future register(String username, String email, String password) async {
    //Trocar o IPLOCAL pelo ip de sua máquina
    var url = 'http://IPLOCAL:8000/signup/customer/';
    var header = {"Content-Type": "application/json"};

    Map params = {
      "user": {
        "username": username,
        "email": email,
        "password": password,
      },
    };

    String _body = json.encode(params);
    var response = await http.post(url, headers: header, body: _body);

    // Exemplo de código para depois que a conta for criada
    // if (response.statusCode == 201) {}
    // else {}
  }
}
