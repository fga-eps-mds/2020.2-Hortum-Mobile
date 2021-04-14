import 'package:hortum_mobile/globals.dart';
import 'package:http/http.dart' as http;

class DeleteAnnounApi {
  static Future deleteAnnoun(String anuncio) async {
    String userAccessToken = await actualUser.readSecureData('token_access');
    var url = 'http://$ip:8000/announcement/update/$anuncio' as Uri;
    var header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + userAccessToken,
    };

    await http.delete(url, headers: header);
  }
}
