import 'package:dio/dio.dart';
import 'package:hortum_mobile/globals.dart';

class ComplaintDataAPI {
  List<dynamic> complaints = [];
  Dio dio;

  ComplaintDataAPI([Dio client]) {
    if (client == null) {
      this.dio = Dio();
    } else {
      this.dio = client;
    }
  }

  Future listComplaint({String emailProductor}) async {
    //Trocar o IPLOCAL pelo ip de sua máquina

    var url = '$ip/complaint/list/${emailProductor}';
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
    complaints = response.data;
  }

  Future registerComplaint(
      {String name, String description, String emailProductor}) async {
    //Trocar o IPLOCAL pelo ip de sua máquina
    var url = '$ip/complaint/create/';
    var header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + actualUser.tokenAccess,
    };

    var params = {
      "author": name,
      "description": description,
      "emailProductor": emailProductor,
      "image": complaint_picture != null
          ? await MultipartFile.fromFile(complaint_picture.path,
              filename: complaint_picture.path.split('/').last)
          : null
    };

    FormData body = FormData.fromMap(params);

    Response response = await dio.post(url,
        data: body,
        options: Options(
          headers: header,
          contentType: 'multipart/form-data',
          validateStatus: (status) {
            return status <= 500;
          },
        ));
    return response.statusCode;
  }
}
