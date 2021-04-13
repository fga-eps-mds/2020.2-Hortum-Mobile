import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:hortum_mobile/globals.dart';

class ProductorsDataApi {
  List<dynamic> productors = [];

  Future getProductors(String filter) async {
    //Trocar o IPLOCAL pelo ip de sua máquina
    String userAccessToken = await actualUser.readSecureData('token_access');
    String url;
    if (filter.isEmpty)
      url = 'http://$ip:8000/productor/list';
    else
      url = 'http://$ip:8000/productor/list/${filter}';

    var header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + userAccessToken,
    };

    var response = await http.get(url, headers: header);
    print(response.body.runtimeType);
    this.productors = json.decode(response.body);
  }
}
