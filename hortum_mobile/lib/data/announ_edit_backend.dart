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
      "name": "dedu bom",
      "description": description,
      "price": price,
      "type_of_product": category,
      "inventory": inventory
    };
    params.removeWhere((key, value) => value == null);

    /*if (name != null) params.addAll({"name": name});
    if (description != null) params.addAll({"description": description});
    if (price != null) params.addAll({"price": price});
    if (category != null) params.addAll({"category": category});
    if (inventory != null) params.addAll({"inventory": inventory});*/

    String _body = json.encode(params);

    var response = await http.patch(url, headers: header, body: _body);
    print(response.body);
    Map mapResponse = json.decode(response.body);
    print(mapResponse.values);
  }
}
