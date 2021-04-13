import 'package:dio/dio.dart';

import 'package:hortum_mobile/globals.dart';

class AnnounDataApi {
  List<dynamic> announcements = [];
  Dio dio;

  AnnounDataApi([Dio client]) {
    if (client == null) {
      this.dio = Dio();
    } else {
      this.dio = client;
    }
  }

  Future getAnnoun(String filter) async {
    //Trocar o IPLOCAL pelo ip de sua máquina
    // String userAccessToken = await actualUser.readSecureData('token_access');
    String url;
    if (filter.isEmpty)
      url = 'http://$ip:8000/announcement/list';
    else
      url = 'http://$ip:8000/announcement/list/${filter}';

    var header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + 'token',
    };

    var response = await this.dio.get(url, options: Options(headers: header));
    this.announcements = response.data;

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
