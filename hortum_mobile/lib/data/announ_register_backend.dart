import 'dart:convert';
import 'package:hortum_mobile/globals.dart';
import 'package:http/http.dart' as http;

class RegisterAnnounApi {
  static Future registerAnnoun(
      String name, String description, double price, String category) async {
    //Trocar o IPLOCAL pelo ip de sua máquina
    String userAccessToken = await actualUser.readSecureData('token_access');
    var url = 'http://IPLOCAL:8000/announcement/create';
    var header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + userAccessToken,
    };

    String email = await actualUser.readSecureData('email');
    Map params = {
      "email": email,
      "name": name,
      "description": description,
      "price": price,
      "type_of_product": category,
    };

    String _body = json.encode(params);
    var response = await http.post(url, headers: header, body: _body);
    Map mapResponse = json.decode(response.body);
    print(mapResponse.values);
  }
}
