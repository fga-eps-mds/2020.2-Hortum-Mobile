import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:hortum_mobile/globals.dart';

class AnnounDataApi {
  List<Map> announcements = [];

  Future getAnnoun() async {
    //Trocar o IPLOCAL pelo ip de sua máquina
    String userAccessToken = await actualUser.readSecureData('token_access');
    var url = 'http://$ip:8000/productor/list';
    var header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + userAccessToken,
    };

    var response = await http.get(url, headers: header);
    List announs = json.decode(response.body);
    prepareAnnouncement(announs);
  }

  prepareAnnouncement(List response) {
    response.forEach((element) {
      String name = element['user']['username'].toString().split(" ")[0];
      String profilePic = element['idPicture'];
      element['announcements'].forEach((element) {
        Map<String, String> announcement = Map();
        announcement['name'] = name;
        announcement['profilePic'] = profilePic;
        announcement['title'] = element['name'];
        announcement['price'] =
            "R\$${element['price'].toStringAsFixed(2).replaceFirst('.', ',')}";
        announcement['productPicture'] = element['idPicture'];
        this.announcements.add(announcement);
      });
    });
  }
}
