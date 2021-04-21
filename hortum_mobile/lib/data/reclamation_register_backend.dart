import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:hortum_mobile/globals.dart';

class ReclamationAPI {
  Dio dio;

  ReclamationAPI([Dio client]) {
    if (client == null) {
      this.dio = Dio();
    } else {
      this.dio = client;
    }
  }

  Future registerReclamation(
      String name, String description, String emailProductor) async {
    //Trocar o IPLOCAL pelo ip de sua máquina
    var url = 'http://$ip:8000/reclamation/create/';
    var header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + actualUser.tokenAccess,
    };

    Map params = {
      "author": name,
      "description": description,
      "emailProductor": emailProductor
    };

    String _body = json.encode(params);
    Response response = await dio.post(url,
        data: _body,
        options: Options(
          headers: header,
          validateStatus: (status) {
            return status <= 500;
          },
        ));
    return response.statusCode;
  }
}
