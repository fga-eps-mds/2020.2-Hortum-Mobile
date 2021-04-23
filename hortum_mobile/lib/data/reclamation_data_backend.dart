import 'package:dio/dio.dart';
import 'package:hortum_mobile/globals.dart';

class ReclamationDataAPI {
  List<dynamic> reclamations = [];
  Dio dio;

  ReclamationDataAPI([Dio client]) {
    if (client == null) {
      this.dio = Dio();
    } else {
      this.dio = client;
    }
  }

  Future listReclamation({String emailProductor}) async {
    //Trocar o IPLOCAL pelo ip de sua máquina

    var url = 'http://$ip:8000/reclamation/list/${emailProductor}';
    var header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + actualUser.tokenAccess,
    };

    Response response = await dio.get(url,
        options: Options(
          headers: header,
          validateStatus: (status) {
            return status <= 500;
          },
        ));
    reclamations = response.data;
  }
}
