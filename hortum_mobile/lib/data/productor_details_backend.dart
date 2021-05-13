import 'package:dio/dio.dart';
import 'package:hortum_mobile/globals.dart';

class ProductorsDetailsApi {
  Dio dio;
  List<dynamic> announcements = [];

  ProductorsDetailsApi([Dio client]) {
    if (client == null)
      this.dio = Dio();
    else
      this.dio = client;
  }

  Future getDetails(String email) async {
    //Trocar o IPLOCAL pelo ip de sua máquina
    String url;
    url = '$ip/announcement/retrieve/${email}';

    var header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + actualUser.tokenAccess,
    };
    Response response = await dio.get(url, options: Options(headers: header));
    this.announcements = response.data;
  }
}
