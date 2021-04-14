import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/services/codec_string.dart';

class ProdLoggedAnnounDataApi {
  List<dynamic> announcements = [];
  var productor;

  Future getAnnounProd() async {
    
    String userAccessToken = await actualUser.readSecureData('token_access');
    String encodedEmail = codec_string.encodeString(actualUser.email); 
    String url = 'https://$ip:8000/productor/retrieve/${encodedEmail}';

    var header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + userAccessToken,
    };

    var response = await http.get(url, headers: header);
    this.productor = json.decode(response.body);
    this.announcements = json.decode(this.productor['announcements']);
    return this.announcements;
  }
}