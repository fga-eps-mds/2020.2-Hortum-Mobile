import 'dart:convert';
import 'package:hortum_mobile/globals.dart';
import 'package:http/http.dart' as http;

class DeleteAnnounApi {
  static Future deleteAnnoun(String anuncio) async {
    String userAccessToken = await actualUser.readSecureData('token_access');
    var url = 'http://$ip:8000/announcement/update/$anuncio';
    var header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + userAccessToken,
    };

    var response = await http.delete(url, headers: header);
  }
}
