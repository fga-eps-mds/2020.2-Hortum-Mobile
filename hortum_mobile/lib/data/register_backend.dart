import 'dart:convert';
import 'package:hortum_mobile/globals.dart';
import 'package:http/http.dart' as http;

class RegisterApi {
  static Future register(
      String username, String email, String password, bool isProductor) async {
    //Trocar o IPLOCAL pelo ip de sua máquina
    var urlCustomer = 'http://$ip:8000/signup/customer/' as Uri;
    var urlProductor = 'http://$ip:8000/signup/productor/' as Uri;
    var header = {"Content-Type": "application/json"};

    Map params = {
      "user": {
        "username": username,
        "email": email,
        "password": password,
      },
    };

    String _body = json.encode(params);
    if (isProductor == false) {
      await http.post(urlCustomer, headers: header, body: _body);
    } else {
      await http.post(urlProductor, headers: header, body: _body);
    }
    // Exemplo de código para depois que a conta for criada
    // if (response.statusCode == 201) {}
    // else {}
  }
}
