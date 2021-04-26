import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:hortum_mobile/globals.dart';

class RegisterAnnounApi {
  Dio dio;

  RegisterAnnounApi([Dio client]) {
    if (client == null)
      this.dio = Dio();
    else {
      this.dio = client;
    }
  }

  Future registerAnnoun(
      String name, String description, double price, String category) async {
    //Trocar o IPLOCAL pelo ip de sua máquina
    String userAccessToken = actualUser.tokenAccess;
    String url = 'http://$ip:8000/announcement/create';
    var header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + userAccessToken,
    };

    String email = actualUser.email;
    Map params = {
      "email": email,
      "name": name,
      "description": description,
      "price": price,
      "type_of_product": category,
    };

    String _body = json.encode(params);
    Response response = await this
        .dio
        .post(url, data: _body, options: Options(headers: header));

    return response;
  }
}
