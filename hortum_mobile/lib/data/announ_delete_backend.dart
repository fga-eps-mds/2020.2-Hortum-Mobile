import 'package:dio/dio.dart';
import 'package:hortum_mobile/globals.dart';

class DeleteAnnounApi {
  Dio dio;
  DeleteAnnounApi([Dio client]) {
    if (client == null)
      this.dio = Dio();
    else
      this.dio = client;
  }

  Future deleteAnnoun(String anuncio) async {
    String userAccessToken = actualUser.tokenAccess;
    String url = 'http://$ip:8000/announcement/update/$anuncio';
    var header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + userAccessToken,
    };

    Response response =
        await this.dio.delete(url, options: Options(headers: header));
    return response.statusCode;
  }
}
