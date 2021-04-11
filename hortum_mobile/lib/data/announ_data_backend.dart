import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:hortum_mobile/globals.dart';

class AnnounDataApi {
  List<dynamic> announcements = [];

  Future getAnnoun() async {
    //Trocar o IPLOCAL pelo ip de sua máquina
    String userAccessToken = await actualUser.readSecureData('token_access');
    var url = 'http://$ip:8000/announcement/list';
    var header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + userAccessToken,
    };

    var response = await http.get(url, headers: header);
    this.announcements = json.decode(response.body);
    print(json.decode(response.body));

    manipulateData();
  }

  manipulateData() {
    this.announcements.forEach((element) {
      element['price'] =
          "R\$ ${element['price'].toStringAsFixed(2).replaceFirst('.', ',')}";
      element['username'] = element['username'].toString().split(" ")[0];
    });
  }
}
