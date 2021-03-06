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
    var url = '$ip/customer/fav-productor';
    var header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + actualUser.tokenAccess,
    };
    Map params = {"email": email};

    String _body = json.encode(params);
    Response response = await dio.patch(url,
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
