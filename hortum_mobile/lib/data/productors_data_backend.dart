import 'package:dio/dio.dart';

import 'package:hortum_mobile/globals.dart';

class ProductorsDataApi {
  List<dynamic> productors = [];
  Dio dio;

  ProductorsDataApi([Dio client]) {
    if (client == null)
      this.dio = Dio();
    else
      this.dio = client;
  }

  Future getProductors(String filter) async {
    //Trocar o IPLOCAL pelo ip de sua máquina
    String url;
    if (filter.isEmpty)
      url = 'http://$ip:8000/productor/list';
    else
      url = 'http://$ip:8000/productor/list/${filter}';

    var header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + actualUser.tokenAccess,
    };
    Response response = await dio.get(url, options: Options(headers: header));
    this.productors = response.data;
  }
}
