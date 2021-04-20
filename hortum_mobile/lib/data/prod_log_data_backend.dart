import 'package:dio/dio.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/services/codec_string.dart';

class ProdLoggedAnnounDataApi {
  List<dynamic> announcements = [];
  var productor;
  Dio dio;

  ProdLoggedAnnounDataApi([Dio client]) {
    if (client == null) {
      this.dio = Dio();
    } else {
      this.dio = client;
    }
  }

  Future getAnnounProd() async {
    String encodedEmail = encodeString(actualUser.email);
    String url = 'http://$ip:8000/productor/retrieve/${encodedEmail}';

    var header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + actualUser.tokenAccess,
    };

    Response response =
        await this.dio.get(url, options: Options(headers: header));

    this.productor = response.data;
    this.announcements = this.productor['announcements'];
    manipulateData();
  }

  manipulateData() {
    this.announcements.forEach((element) {
      element['price'] =
          "R\$ ${element['price'].toStringAsFixed(2).replaceFirst('.', ',')}";
      element['username'] = element['username'].toString().split(" ")[0];
    });
  }
}
