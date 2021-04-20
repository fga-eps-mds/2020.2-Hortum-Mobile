import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:hortum_mobile/globals.dart';

class EditAnnounApi {
  Dio dio;

  EditAnnounApi([Dio client]) {
    if (client == null) {
      this.dio = Dio();
    } else {
      this.dio = client;
    }
  }

  Future editAnnoun(String nomeOriginal,
      {String name,
      String description,
      double price,
      String category,
      bool inventory}) async {
    String url = 'http://$ip:8000/announcement/update/$nomeOriginal';

    var header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + actualUser.tokenAccess,
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

    var response = await dio.patch(url,
        data: _body,
        options: Options(
          headers: header,
          validateStatus: (status) {
            return status <= 500;
          },
        ));
    return response;
  }
}
