import 'dart:convert';
import 'package:http/http.dart' as http;

class RegisterApi {
  static Future register(
      String username, String email, String password, bool isProductor) async {
    //Trocar o IPLOCAL pelo ip de sua máquina
    var urlCustomer = 'http://IPLOCAL:8000/signup/customer/';
    var urlProductor = 'http://IPLOCAL:8000/signup/productor/';
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
      var response = await http.post(urlCustomer, headers: header, body: _body);
    } else {
      var response =
          await http.post(urlProductor, headers: header, body: _body);
    }
    // Exemplo de código para depois que a conta for criada
    // if (response.statusCode == 201) {}
    // else {}
  }
}
