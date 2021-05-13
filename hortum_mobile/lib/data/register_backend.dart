import 'package:dio/dio.dart';
import 'package:hortum_mobile/globals.dart';

class RegisterApi {
  Dio dio;

  RegisterApi([Dio client]) {
    if (client == null)
      this.dio = Dio();
    else
      this.dio = client;
  }

  Future register(String username, String email, String password,
      String telefone, bool isProductor) async {
    String urlCustomer = '$ip/signup/customer/';
    String urlProductor = '$ip/signup/productor/';
    Response response;
    String filename;

    var header = {"Content-Type": "application/json"};

    if (profile_picture != null)
      filename = profile_picture.path.split('/').last;
    var params = FormData.fromMap({
      "user.username": username,
      "user.email": email,
      "user.password": password,
      "user.phone_number": telefone,
      "user.profile_picture": profile_picture != null
          ? await MultipartFile.fromFile(profile_picture.path,
              filename: filename)
          : null
    });

    if (isProductor == false) {
      response = await this.dio.post(urlCustomer,
          data: params,
          options: Options(
              headers: header,
              validateStatus: (status) {
                return status <= 500;
              },
              contentType: 'multipart/form-data'));
    } else {
      response = await dio.post(urlProductor,
          data: params,
          options: Options(
              headers: header,
              validateStatus: (status) {
                return status <= 500;
              },
              contentType: 'multipart/form-data'));
    }
    profile_picture = null;
    return response;
  }
}
