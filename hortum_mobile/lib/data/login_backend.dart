import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:hortum_mobile/globals.dart';
import 'package:hortum_mobile/model/user.dart';

class LoginApi {
  Dio dio;

  LoginApi([Dio client]) {
    if (client == null) {
      this.dio = Dio();
    } else {
      this.dio = client;
    }
  }

  Future login(String email, String password) async {
    //Trocar o IPLOCAL pelo ip de sua máquina
    var url = '$ip/login/';
    var header = {"Content-Type": "application/json"};

    Map params = {
      "email": email,
      "password": password,
    };

    String _body = json.encode(params);
    Response response = await dio.post(
      url,
      data: _body,
      options: Options(
        headers: header,
        validateStatus: (status) {
          return status <= 500;
        },
      ),
    );

    if (response.statusCode == 200) {
      actualUser = User.fromJson(response.data);
      actualUser.writeSecureData('email', actualUser.email);
      actualUser.writeSecureData('token_refresh', actualUser.tokenRefresh);
      actualUser.writeSecureData('token_access', actualUser.tokenAccess);
      actualUser.writeSecureData('phone_number', actualUser.phone_number);
      actualUser.writeSecureData('profile_picture', actualUser.profile_picture);
    } else {
      actualUser = null;
    }
    return actualUser;
  }
}
