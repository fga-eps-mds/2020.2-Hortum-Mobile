import 'dart:convert';
import 'package:hortum_mobile/globals.dart';
import 'package:http/http.dart' as http;

class EditAnnounApi {
  static Future editAnnoun(String nomeOriginal,
      {String name,
      String description,
      double price,
      String category,
      bool inventory}) async {
    String userAccessToken = await actualUser.readSecureData('token_access');
    var url = 'http://$ip:8000/announcement/update/$nomeOriginal';
    var header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + userAccessToken,
    };
    Map params = {
      "name": name,
      "description": description,
      "price": price,
      "type_of_product": category,
      "inventory": inventory
    };
    params.removeWhere((key, value) => value == null);

    String _body = json.encode(params);

    var response = await http.patch(url, headers: header, body: _body);
    Map mapResponse = json.decode(response.body);
  }
}
