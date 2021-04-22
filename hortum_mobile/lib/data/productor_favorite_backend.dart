import 'dart:convert';

import 'package:dio/dio.dart';

import '../globals.dart';

class ProductorFavAPI {
  Dio dio;

  ProductorFavAPI([Dio client]) {
    if (client == null) {
      this.dio = Dio();
    } else {
      this.dio = client;
    }
  }

  Future favProductor(String email) async {
    var url = 'http://$ip:8000/customer/fav-productor';
    var header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + actualUser.tokenAccess,
    };
    Map params = {"email": email};

    String _body = json.encode(params);
    await dio.patch(url,
        data: _body,
        options: Options(
          headers: header,
          validateStatus: (status) {
            return status <= 500;
          },
        ));
  }
}
