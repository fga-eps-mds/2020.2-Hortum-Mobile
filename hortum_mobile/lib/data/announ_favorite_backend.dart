import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:hortum_mobile/globals.dart';

class AnnounFavAPI {
  Dio dio;

  AnnounFavAPI([Dio client]) {
    if (client == null) {
      this.dio = Dio();
    } else {
      this.dio = client;
    }
  }

  Future favAnnoun(String email, String announcementName) async {
    var url = '$ip/customer/fav-announcement';
    var header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + actualUser.tokenAccess,
    };
    Map params = {"email": email, "announcementName": announcementName};

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
